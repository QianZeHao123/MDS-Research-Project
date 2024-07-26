import random
import networkx as nx
from mesa import Model
from mesa.time import RandomActivation
from mesa.space import NetworkGrid
from mesa.datacollection import DataCollector
from .bass_agent import BassAgent


class BassModel(Model):
    def __init__(self, N, p, q, agent_proportion, network_type="small_world"):
        """
        N: Number of agents
        p: Probability of innovators to accept the product
        q: Probability of imitators to accept the product
        agent_proportion: this is a list of lists, where each list contains the proportion of influential innovators, influential imitators, non-influential innovators, and non-influential imitators
        network_type: Type of network to use. Options are "random", "small_world", and "scale_free", default is "small_world"
        """
        super().__init__()
        self.running = True

        # set the steps to reach 25%, 50%, 75%, and 100% adoption to None
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

        """
        # The following code is not needed as the agent_proportion is already a list of lists
        # proportion_influential_innovators = agent_proportion[0]
        # proportion_influential_imitators = agent_proportion[1]
        # proportion_non_influential_innovators = agent_proportion[2]
        # proportion_non_influential_imitators = agent_proportion[3]
        """

        proportion_influential_innovators, proportion_influential_imitators, proportion_non_influential_innovators, proportion_non_influential_imitators = agent_proportion

        self.custom_agents = []

        # Generate agent distribution
        agent_distribution = self.generate_agent_distribution(N, proportion_influential_innovators,
                                                              proportion_influential_imitators,
                                                              proportion_non_influential_innovators,
                                                              proportion_non_influential_imitators)

        # Create agents and give them attributes based on the agent_distribution (agent type and influencer status)
        for i, node in enumerate(self.G.nodes()):
            agent_type, influencer = agent_distribution[i]
            agent = BassAgent(i, self, agent_type, influencer)
            self.schedule.add(agent)
            self.custom_agents.append(agent)

        # Create a network grid and place the agents on the grid
        self.grid = NetworkGrid(self.G)
        for i, node in enumerate(self.G.nodes()):
            self.grid.place_agent(self.custom_agents[i], node)

        # Add more edges if the agent is an influencer
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

        # Set the initial position of the agents
        self.pos = nx.spring_layout(self.G)

        # data collector to collect data
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

    # Function to generate agent distribution
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

    # Function to step through the model
    # This function is called by the batch_run function in main.py
    # The batch_run function will run the model for the specified number of iterations and steps
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
