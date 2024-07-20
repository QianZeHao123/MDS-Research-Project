import random
import networkx as nx
import matplotlib.pyplot as plt
from mesa import Model
from mesa.time import RandomActivation
from mesa.space import NetworkGrid
from mesa.datacollection import DataCollector
from .bass_agent import ConsumerAgent


class BassModel(Model):
    def __init__(self, N, p, q, proportion_innovators, proportion_influencers, network_type="random"):

        # invoke the parent class's __init__ method
        super().__init__()
        # keep the model running
        self.running = True

        """
        Add tracking of reaching a specific acceptance rate
        (i.e. 25%, 50%, 75%) at a specific step
        (i.e. 25%, 50%, 75%) in the data collector
        """

        self.steps_to_25_percent = None
        self.steps_to_50_percent = None
        self.steps_to_75_percent = None
        self.steps_to_100_percent = None
        # agent parameters
        self.num_agents = N
        self.p = p
        self.q = q
        # create a scheduler for the agents to act in random order
        self.schedule = RandomActivation(self)

        # create a network
        if network_type == "random":
            self.G = nx.erdos_renyi_graph(n=N, p=0.05)
        elif network_type == "small_world":
            self.G = nx.watts_strogatz_graph(n=N, k=4, p=0.1)

        # create agents and set their types and influence
        self.custom_agents = []  # store the agents with custom methods
        for i, node in enumerate(self.G.nodes()):
            agent_type = 'Innovator' if random.random() < proportion_innovators else 'Imitator'
            influencer = random.random() < proportion_influencers
            agent = ConsumerAgent(i, self, agent_type, influencer)
            self.schedule.add(agent)
            self.custom_agents.append(agent)

        # initialize NetworkGrid and place agents
        self.grid = NetworkGrid(self.G)
        for i, node in enumerate(self.G.nodes()):
            self.grid.place_agent(self.custom_agents[i], node)

        # add additional edges for influencers
        # exclusive the original edges when initialize the network and the agent itself
        for agent in self.custom_agents:
            if agent.influencer:
                current_neighbors = set(self.G.neighbors(agent.pos))
                potential_neighbors = list(
                    set(self.G.nodes()) - current_neighbors - {agent.pos})

                additional_edges = random.sample(
                    potential_neighbors, min(int(50*random.random()), len(potential_neighbors)))

                for target in additional_edges:
                    if not self.G.has_edge(agent.pos, target):
                        self.G.add_edge(agent.pos, target)

        # Save fixed positions for nodes
        self.pos = nx.spring_layout(self.G)


        # -----------------------------------------------
        # # Print agent details after adding additional edges for influencers
        # # uncomment the following to show the debug infomation
        # for agent in self.custom_agents:
        #     neighbors = list(self.G.neighbors(agent.pos))
        #     print(
        #         f'-------------------Agent {agent.unique_id}-----------------------')
        #     print(
        #         f"Agent {agent.unique_id}: Influencer={agent.influencer}, Type={agent.agent_type}, Neighbors={neighbors}")
        # -----------------------------------------------

        print(f"\nNumber of agents: {self.num_agents} \n")
        print(f"Value of p: {self.p} \n")
        print(f"Value of q: {self.q} \n")
        print(f"Proportion of Innovators: {proportion_innovators} \n")
        print(f"Proportion of Influencers: {proportion_influencers} \n")
        print(f"Network Type: {network_type} \n")

        self.datacollector = DataCollector(
            agent_reporters={"Adopted": "adopted",
                             "Influencer": "influencer",
                             "Agent_Type": "agent_type",
                             "Neighbors": lambda a: [neighbor.unique_id for neighbor in a.neighbors]},
            model_reporters={
                "Adopted_Count": self.compute_adopted,
                "Influencer_Count": self.compute_influencers,
                "Non_Influencer_Count": self.compute_non_influencers,
                "Innovator_Count": self.compute_innovators,
                "Imitator_Count": self.compute_imitators,
                "Steps_to_25_percent": lambda m: m.steps_to_25_percent,
                "Steps_to_50_percent": lambda m: m.steps_to_50_percent,
                "Steps_to_75_percent": lambda m: m.steps_to_75_percent,
                # "Steps_to_100_percent": lambda m: m.steps_to_100_percent
            }
        )

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

        # if self.steps_to_100_percent is None and adoption_rate == 1.0:
        #     self.steps_to_100_percent = self.schedule.steps

    def compute_adopted(self):
        adopted_count = sum(
            [1 for agent in self.custom_agents if agent.adopted])
        return adopted_count

    def compute_influencers(self):
        influencer_count = sum(
            [1 for agent in self.custom_agents if (agent.influencer and agent.adopted)])
        return influencer_count

    def compute_non_influencers(self):
        non_influencer_count = sum(
            [1 for agent in self.custom_agents if (not agent.influencer and agent.adopted)])
        return non_influencer_count

    def compute_innovators(self):
        innovator_count = sum([1 for agent in self.custom_agents if (
            agent.agent_type == 'Innovator' and agent.adopted)])
        return innovator_count

    def compute_imitators(self):
        imitator_count = sum([1 for agent in self.custom_agents if (
            agent.agent_type == 'Imitator' and agent.adopted)])
        return imitator_count

    def compute_adoption_rate(self):
        return sum([1 for agent in self.custom_agents if agent.adopted]) / self.num_agents

