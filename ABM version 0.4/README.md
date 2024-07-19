# ABM Research for Marketing Diffusion
[Environment Configuration](../README.md)



```mermaid
---
title: Class Diagram for ABM
---
classDiagram

    class ConsumerAgent{
        Unique ID
        Agent Type: Innovator/Imitator
        Influencer: True/False
        Neighbour list
        ChangeAdoption()
    }

    ConsumerAgent --|> BassModel

    class BassModel{
        Number of Agents: N
        Probability of Innovator: p
        Probability of Imitator: q
        Network Type: Random/Small World
        init_agent()
        init_model()
        datacollector()
        compute_adopted()
        compute_influencers()
        compute_non_influencers()
        compute_innovators()
        compute_imitators()
        compute_adoption_rate()
        save_network()
    }

```

