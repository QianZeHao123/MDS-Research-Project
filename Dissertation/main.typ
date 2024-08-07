#import "template.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#let today = datetime.today()
#show: project.with(
  title: "Data Science Research Project",
  subtitle: "Agent-based Modelling for Market Diffusion Research",
  authors: ((name: "Student Name: Zehao Qian", email: "zehao.qian.cn@gmail.com"), (
    name: "Supervisor Name: Jennifer Badham",
    email: "jennifer.badham@durham.ac.uk",
  ),),
  abstract: lorem(59 + 11),
  date: today.display("[month repr:long] [day], [year]"),
)

// ------------------------------------------------
// outline part
#show link: underline
#show outline.entry.where(level: 1): it => {
  v(12pt, weak: true)
  strong(it)
}
#outline(title: [Table of Contents], indent: auto, depth: 3)
#outline(title: [List of Tables], target: figure.where(kind: table))
#outline(title: [List of Figures], target: figure.where(kind: image))
// ------------------------------------------------

#show figure: set block(breakable: true)

= Introduction and Research Question

== Introduction

#lorem(300)

== Research Question

#lorem(50)

= Literature Review

== Agent-based Modelling and Simulation

=== Definition and Concept of Agent-Based Modelling

Agent-Based Modeling (ABM) is an innovative and powerful modeling and simulation
approach used to study and understand the dynamic behavior of complex systems
@macal_tutorial_2005. The core concept of ABM is to evaluate the impact on an
entire system by simulating the behavior and interactions of numerous autonomous
individuals within it, known as agents. The fundamental premise of ABM is that
even complex phenomena can be understood and simulated through a series of
autonomous agents following specific interaction rules @zheng_primer_2013.

Unlike traditional equation-based modeling methods, ABM employs a rule-based
approach to construct models @dorri_multi-agent_2018, making it particularly
suitable for simulating complex dynamic systems. In ABM, each agent is endowed
with the ability to make autonomous decisions @macal_agent-based_2009, acting
based on its own state, surrounding environment, and interactions with other
agents @macal_everything_2016. These agents not only influence their physical
and social environment but are also influenced by it, forming an intricate
network of interactions.

A key feature of ABM is its capacity to capture heterogeneity within a system,
allowing for the simulation of agents with diverse characteristics and
behaviors, thus more accurately reflecting the diversity of the real world.
Through ABM, researchers can observe and analyze how complex behaviors and
patterns at the system level emerge from simple rules at the individual level.
This "bottom-up" modeling approach makes ABM a powerful tool for studying
emergent phenomena, adaptive behaviors, and the evolution of complex systems.

In ABM, agents are core elements with multiple characteristics, including
autonomy, heterogeneity, proactivity, and reactivity. They can make independent
decisions, interact with each other, learn and adapt, perceive their
environment, and act according to specific rules @davidsson_multi_2001. Agents
typically possess bounded rationality, goal-oriented behavior, and variable
internal states. These features enable ABM to effectively simulate individual
behaviors and overall dynamics in complex systems.

=== ABM modeling process and technical implementation

// Agents: Autonomous individuals with specific attributes and behavioral rules
// Environment: The context in which agents operate
// Interaction Rules: Governing agent-to-agent and agent-environment interactions

The ABM models contains three main components: agents, environment, and interaction rules. 

#figure(
  caption: "Main Components of ABM",
  table(
    columns: (auto, auto),
    align: center,
    stroke: none,
    table.hline(),
    table.header([*ABM Components*], [*Description*]),
    table.hline(),
    [Agents],
    [Autonomous individuals with specific attributes and behavioral rules],
    [Environment],
    [The context in which agents operate],
    [Interaction Rules],
    [Governing agent-to-agent and agent-environment interactions],
    table.hline(),
  ),
)

Refer to @badham_developing_2018 and Gilbert's ABM specification sheet @gilbert_abm_nodate for summarizing the ABM modeling process:

+ Define model purpose and scope.
+ Identify and characterize agents.
+ Determine agent behavior theories and decision rules.
+ Establish agent relationships and interaction theories.
+ Design the environment.
+ Choose an ABMS platform and development strategy.
+ Implement learning and evolution strategies.
+ Incorporate security mechanisms @ramchurn_trust_2004.
+ Develop interaction protocols.
+ Collect relevant agent data.
+ Validate agent behavior models.
+ Run simulations and analyze output results.
+ Link micro-level agent behaviors to macro-level system behaviors.

The setting of interaction rules, the selection of key parameters and the verification of results of ABM are the core links in the modeling process. The interaction rules are usually implemented by setting the behavior and topological structure of the agent, including the "Soup" model, cellular automata, Euclidean space, GIS and network topology @macal_agent-based_2009. The key parameters cover the personal characteristics and environmental factors of the agent @conte_agent-based_2014, and may also include specific belief parameters @ramchurn_trust_2004. The result verification methods include comparing the ABM simulation results with classical models or empirical data, adopting multi-level verification methods (calibrating parameters at the micro level and observing the reality of macro behavior) @conte_agent-based_2014, and using social network analysis and participatory simulation to obtain information about agent behavior and interaction. However, due to the complexity of ABM models, verification and calibration remain one of the main challenges, and the lack of standardized methods makes it difficult to interpret and analyze the results.

=== Pros and Cons of ABM and its Applications

The main advantage of ABM is its powerful ability to simulate complex systems. It can capture complex interactions between heterogeneous agents, observe macro-emergent phenomena generated by micro-behavior @conte_agent-based_2014, and provide an intuitive and realistic description of the system. The flexibility of ABM enables it to easily adapt to different scenarios and simulate the learning and adaptive behavior of agents @dorri_multi-agent_2018. It supports multi-level modeling that simultaneously considers dynamics at the individual, organizational and system levels. ABM is also spatially explicit, able to simulate the movement and interaction of agents in specific environments @davidsson_multi_2001. In addition, it provides generative explanations, can improve efficiency through parallel computing, and can be integrated with other modeling methods to enhance overall modeling capabilities.

However, ABM also faces some significant challenges and limitations. The most prominent one is the difficulty of verification @zheng_primer_2013. Due to the complexity of the model, it is difficult to fully verify the accuracy of the results. ABM often requires powerful computing resources, especially for large-scale or complex models @conte_agent-based_2014. It also requires large amounts of detailed process data for calibration and validation, which increases the difficulty of data collection. The complexity of parameter calibration and the highly technical requirements of the model are also important constraints. In addition, the complex interactions and emergent behaviors generated by ABM can be difficult to interpret, running the risk of producing arbitrary and inconsistent models. High computational cost, lack of unified modeling standards, and the possibility of overfitting are important issues to consider when using ABM. Despite these challenges, ABM remains a powerful tool for studying complex systems, but its use requires careful weighing of these advantages and disadvantages.

ABM has been widely used in multiple disciplines, demonstrating its strong potential as an interdisciplinary research tool and its applicability in systems of different scales and complexities, providing researchers with a powerful tool to understand and predict complex social, economic, and natural phenomena @macal_tutorial_2005.

#figure(
  caption: "Applications of ABM in Various Fields",
  table(
    columns: (auto, auto),
    align: (left, left),
    stroke: none,
    table.hline(),
    table.header([*Research Field*], [*Applications*]),
    table.hline(),
    [Social Sciences], [
      - Human behavior and social interactions \
      - Economic systems and artificial financial markets \
      - Political processes and civic behavior \
      - Organizational decision-making \
      - Ancient civilization simulation \
      - Crime analysis \
      - Terrorism network studies \
    ],
    [Natural Sciences], [
      - Ecology (animal group behavior, ecosystems)
      - Biology (cellular behavior, subcellular molecular behavior)
      - Chemistry
    ],
    [Public Health & Medicine], [
      - Infectious disease epidemiology
      - Non-communicable disease research
      - Healthcare systems
    ],
    [Engineering & Technology], [
      - Supply chain management
      - Intelligent/distributed manufacturing
      - Urban planning and distribution center usage
      - Transportation systems (air traffic control)
      - Energy analysis (electricity markets, hydrogen economy)
      - Complex scalable power grid networks
    ],
    [Business & Economics], [
      - Consumer market analysis
      - Financial market simulation
      - Insurance business modeling
      - Trade network analysis
      - Marketing strategies
    ],
    [Environment & Energy], [
      - Climate change impacts
      - Sustainable development strategies
      - Resource management
    ],
    [Military & Security], [
      - Command and control systems
      - Force-on-force simulations
      - Evacuation modeling
    ],
    [Complex Systems Science], [
      - Emergent behavior studies
      - Adaptive systems analysis
      - Multi-level system simulations
    ],
    table.hline(),
  ),
)

=== Application of ABM in complex systems and social science research



=== Theoretical contributions and future development of ABM

== Platforms and Building Philosophy of ABM

== Diffusion of Innovation and Bass Model

== Influencers and Opinion Leaders in Diffusion

== Network Structure and Diffusion

== Conclusion of Literature Review

= Methodology

= Simulation and Results Analysis

== Design of the Experiment

#import "./Tables/simulationPlan.typ": simPlan

#simPlan



#bibliography("references.bib")


