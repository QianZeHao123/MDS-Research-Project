import random
from mesa import Agent


class ConsumerAgent(Agent):
    def __init__(self, unique_id, model, agent_type, influencer):
        super().__init__(unique_id, model)
        self.adopted = False
        self.agent_type = agent_type  # 'Innovator' or 'Imitator'
        self.influencer = influencer  # influencer or not

    def step(self):
        if not self.adopted:
            if self.agent_type == 'Innovator':
                # innovators adopt the product with probability p
                if random.random() < self.model.p:
                    self.adopted = True
            elif self.agent_type == 'Imitator':
                # imitators adopt the product with probability q
                neighbors = self.model.grid.get_neighbors(
                    self.pos, include_center=False)
                adopted_neighbors = [
                    neighbor for neighbor in neighbors if neighbor.adopted]
                if len(neighbors) > 0 and random.random() < self.model.q * len(adopted_neighbors) / len(neighbors):
                    self.adopted = True

    @property
    def neighbors(self):
        return list(self.model.grid.get_neighbors(self.pos, include_center=False))
