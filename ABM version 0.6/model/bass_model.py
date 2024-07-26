import random
import networkx as nx
import matplotlib.pyplot as plt
from mesa import Model
from mesa.time import RandomActivation
from mesa.space import NetworkGrid
from mesa.datacollection import DataCollector
from .bass_agent import BassAgent


class BassModel(Model):
    def __init__(self, N, p, q, proportion_influential_innovators, proportion_influential_imitators,
                 proportion_non_influential_innovators, proportion_non_influential_imitators, network_type="random"):
        super().__init__()
        self.running = True
        self.steps_to_25_percent = None
        self.steps_to_50_percent = None
        self.steps_to_75_percent = None
        self.steps_to_100_percent = None

        self.num_agents = N
        self.p = p
        self.q = q
        self.schedule = RandomActivation(self)

        if network_type == "random":
            self.G = nx.erdos_renyi_graph(n=N, p=0.05)
        elif network_type == "small_world":
            self.G = nx.watts_strogatz_graph(n=N, k=4, p=0.1)
        elif network_type == "scale_free":
            self.G = nx.barabasi_albert_graph(n=N, m=2)

        self.custom_agents = []
        agent_distribution = self.generate_agent_distribution(N, proportion_influential_innovators,
                                                              proportion_influential_imitators,
                                                              proportion_non_influential_innovators,
                                                              proportion_non_influential_imitators)

        for i, node in enumerate(self.G.nodes()):
            agent_type, influencer = agent_distribution[i]
            agent = BassAgent(i, self, agent_type, influencer)
            self.schedule.add(agent)
            self.custom_agents.append(agent)

        self.grid = NetworkGrid(self.G)
        for i, node in enumerate(self.G.nodes()):
            self.grid.place_agent(self.custom_agents[i], node)

        for agent in self.custom_agents:
            if agent.influencer:
                current_neighbors = set(self.G.neighbors(agent.pos))
                potential_neighbors = list(
                    set(self.G.nodes()) - current_neighbors - {agent.pos})
                additional_edges = random.sample(
                    potential_neighbors, min(int(50 * random.random()), len(potential_neighbors)))

                for target in additional_edges:
                    if not self.G.has_edge(agent.pos, target):
                        self.G.add_edge(agent.pos, target)

        self.pos = nx.spring_layout(self.G)

        self.datacollector = DataCollector(
            agent_reporters={
                "Adopted": "adopted",
                "Influencer": "influencer",
                "Agent_Type": "agent_type",
                "Neighbors": lambda a: [neighbor.unique_id for neighbor in a.neighbors],
                "Neighbors_number": lambda a: len(a.neighbors)
            },
            model_reporters={
                "Adopted_Count": self.compute_adopted,
                "Influencer_Count": self.compute_influencers,
                "Non_Influencer_Count": self.compute_non_influencers,
                "Innovator_Count": self.compute_innovators,
                "Imitator_Count": self.compute_imitators,
                "Steps_to_25_percent": lambda m: m.steps_to_25_percent,
                "Steps_to_50_percent": lambda m: m.steps_to_50_percent,
                "Steps_to_75_percent": lambda m: m.steps_to_75_percent,
            }
        )

    def generate_agent_distribution(self, N, prop_influential_innovators, prop_influential_imitators,
                                    prop_non_influential_innovators, prop_non_influential_imitators):
        num_influential_innovators = int(N * prop_influential_innovators)
        num_influential_imitators = int(N * prop_influential_imitators)
        num_non_influential_innovators = int(
            N * prop_non_influential_innovators)
        num_non_influential_imitators = int(N * prop_non_influential_imitators)

        agents = ([('Innovator', True)] * num_influential_innovators +
                  [('Imitator', True)] * num_influential_imitators +
                  [('Innovator', False)] * num_non_influential_innovators +
                  [('Imitator', False)] * num_non_influential_imitators)

        random.shuffle(agents)
        return agents

    def step(self):
        self.datacollector.collect(self)
        self.schedule.step()

        adoption_rate = self.compute_adoption_rate()
        if self.steps_to_25_percent is None and adoption_rate >= 0.25:
            self.steps_to_25_percent = self.schedule.steps
        if self.steps_to_50_percent is None and adoption_rate >= 0.50:
            self.steps_to_50_percent = self.schedule.steps
        if self.steps_to_75_percent is None and adoption_rate >= 0.75:
            self.steps_to_75_percent = self.schedule.steps

    def compute_adopted(self):
        return sum([1 for agent in self.custom_agents if agent.adopted])

    def compute_influencers(self):
        return sum([1 for agent in self.custom_agents if (agent.influencer and agent.adopted)])

    def compute_non_influencers(self):
        return sum([1 for agent in self.custom_agents if (not agent.influencer and agent.adopted)])

    def compute_innovators(self):
        return sum([1 for agent in self.custom_agents if (agent.agent_type == 'Innovator' and agent.adopted)])

    def compute_imitators(self):
        return sum([1 for agent in self.custom_agents if (agent.agent_type == 'Imitator' and agent.adopted)])

    def compute_adoption_rate(self):
        return sum([1 for agent in self.custom_agents if agent.adopted]) / self.num_agents