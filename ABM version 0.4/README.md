# ABM Research for Marketing Diffusion
[Environment Configuration](../README.md)



```mermaid
---
title: Class Diagram for ABM
---
classDiagram
    class ConsumerAgent{
        Unique ID
        Agent Type (Innovator, Imitator)
        Influencer (True, False)
        Neighbour list

    }
    ConsumerAgent --|> BassModel
    class BassModel{
        123
        - asdasd
    }
        BassModel: 123
        BassModel: 456

```



```mermaid

---
title: Animal example
---
classDiagram
    note "From Duck till Zebra"
    Animal <|-- Duck
    note for Duck "can fly\ncan swim\ncan dive\ncan help in debugging"
    Animal <|-- Fish
    Animal <|-- Zebra
    Animal : +int age
    Animal : +String gender
    Animal: +isMammal()
    Animal: +mate()
    class Duck{
        +String beakColor
        +swim()
        +quack()
    }
    class Fish{
        -int sizeInFeet
        -canEat()
    }
    class Zebra{
        +bool is_wild
        +run()
    }

```