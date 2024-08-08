#import "template.typ": *
#import "./Tables/simulationPlan.typ": simPlan
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
      - Human behavior and social interactions
      - Economic systems and political processes
      - Organizational decision-making
      - Crime analysis and terrorism studies
    ],
    [Natural Sciences], [
      - Ecology and ecosystem dynamics
      - Cellular and molecular biology
      - Chemical reactions and processes
    ],
    [Public Health & Medicine], [
      - Epidemiology (infectious and non-communicable diseases)
      - Healthcare systems optimization
    ],
    [Engineering & Technology], [
      - Supply chain and manufacturing
      - Urban planning and transportation
      - Energy systems and power grids
    ],
    [Business & Economics], [
      - Market analysis and financial simulations
      - Trade networks and marketing strategies
    ],
    [Environment & Energy], [
      - Climate change impacts
      - Resource management and sustainability
    ],
    [Military & Security], [
      - Command systems and force simulations
      - Evacuation modeling
    ],
    [Complex Systems Science], [
      - Emergent behavior and adaptive systems
      - Multi-level system simulations
    ],
    table.hline(),
  ),
)

=== Application of ABM in complex systems and social science research

ABM has demonstrated its unique advantages in the study of complex systems and can effectively reflect the complexity and adaptability of the system @zheng_primer_2013. Through simple local rules, ABM can generate complex system behaviors, such as the collective behaviors exhibited by the "Life" and "Boids" models @macal_agent-based_2009. It can simulate multi-level systems, capture complex interactions between individuals and between individuals and the environment, and allow agents to adapt and change decisions over time @badham_developing_2018. ABM can also simulate the properties of complex adaptive systems (CAS), including nonlinearity, fluidity and diversity, as well as feedback mechanisms in the system, which together constitute the complexity and adaptability of the system @macal_tutorial_2005.

In social science research, ABM provides an innovative way to integrate social science theory and computational methods. It applies decision theory in social science (such as the BDI model) to the decision rules of agents @zheng_primer_2013, and combines data mining and complex system modeling to create the emerging field of computational social science. ABM can transform behavioral theories into computable models and calibrate them using multiple data sources. It integrates the theoretical foundations of multiple disciplines, including complexity science, system science, and management science. Through models such as SugarScape, ABM successfully simulates complex social processes @macal_agent-based_2009. In addition, the application of ABM in trust models and other fields demonstrates its ability to combine sociological concepts with computational models. This interdisciplinary approach not only promotes the development of social science theories, but also provides new perspectives and tools for the study of complex social systems.

=== Theoretical contributions and future development of ABM

ABM's contribution to social science theory lies in its unique modeling and analysis capabilities. It can directly simulate individual behaviors and interactions, generate overall system behaviors, and provide a platform for verifying theoretical hypotheses @conte_agent-based_2014. ABM reveals the multi-level nature of social phenomena, demonstrates the dynamic process from micro-behavior to macro-structure, and provides a new perspective on long-standing problems. By introducing computational models, such as computable trust measures, ABM improves traditional research methods and provides new analytical tools and frameworks for social science theory @macal_agent-based_2009.

The cutting-edge and interdisciplinary potential of ABM research is reflected in many aspects. Its application in complex system research is constantly expanding, especially in the study of self-organizing systems. ABM is being integrated with methods such as data mining and machine learning to promote the development of computational social science @davidsson_multi_2001. At the theoretical level, ABM promotes in-depth research on rational agents and system strategic structures. In the future, ABM is expected to make important contributions in the formalization of social selection processes and the standardization of intelligent agent systems, promote the deep integration of social sciences with natural sciences and computational sciences, and open up new prospects for complex system research @macal_agent-based_2009.

== Platforms and Building Philosophy of ABM

=== Platforms for ABM Development

ABM tools encompass a diverse range, including specialized platforms (e.g., NetLogo, GAMA), large-scale development environments (e.g., Repast, MASON), commercial software (e.g., AnyLogic), and frameworks based on general-purpose programming languages (e.g., Mesa for Python). The choice of tool depends on the user's programming experience, project complexity, and specific requirements. Pure ABM builders might find intuitive specialized tools like NetLogo more suitable, while experienced programmers may prefer tools integrated with their familiar languages. For projects requiring GIS integration or large-scale simulations, tools such as GAMA or MASON might be more appropriate. If scientific computing and graph theory related content are needed in the modeling process, it is more appropriate to use the MESA package @project_mesa_team_mesa_nodate.

=== Building Philosophy of ABM

Modeling plays a crucial role in scientific research, with diverse purposes including prediction, explanation, and description. Edmonds emphasize the importance of clarifying model purposes, as this influences modeling and validation strategies @edmonds_different_2019. In terms of modeling strategies, KISS (Keep It Simple, Stupid) and KIDS (Keep It Descriptive, Stupid) represent two distinct approaches. KISS aims for simplicity, while KIDS emphasizes descriptiveness and extensive evidence. Both strategies have their advantages and disadvantages, and the choice depends on factors such as research objectives and phenomenon complexity. As computational power increases and complex systems research advances, KIDS may gain favor in certain fields @edmonds_kiss_2005. However, regardless of the chosen strategy, it is crucial to clearly define the model's purpose and demonstrate its applicability. Researchers should flexibly select strategies based on specific circumstances to construct the most effective models.

Bottom-up ABM starts from the micro-level, defining agents' attributes, behavioral rules, and interactions to simulate complex system dynamics @rixon_bottom-up_2005. This approach allows macro-level phenomena to emerge naturally from micro-level interactions, capturing the heterogeneity and adaptivity of the system @nageli_towards_2020. By constructing models from the individual level, ABM provides a unique perspective for understanding and explaining complex systems, demonstrating the advantages of bottom-up modeling approaches.

With the improvement of computing power, ABM may play an increasingly important role in social sciences. Rand proposed a guiding framework for rigorous use of agent-based modeling (ABM) in research, including using some existing model frameworks, determining the applicability of ABM, designing and building models, and model verification and validation @rand_agent-based_2011.

UML also enhances Agent-Based Modeling by providing higher abstraction, improved readability, and better modularity. It facilitates communication, documentation, and design pattern application while being language-independent. UML captures dynamic behaviors, promotes efficient modeling, and encourages professional practices, ultimately improving ABM quality and maintainability @bersini_uml_2011.

== Diffusion of Innovation and Bass Model



#figure(
  caption: "Bass Model Simulation with Python NumPy and Matplotlib",
  image("img/pic_bass_py_sim/bassmodelsim.png", width: 100%)
)

== Influencers and Opinion Leaders in Diffusion

== Network Structure and Diffusion

== Conclusion of Literature Review

= Methodology

#let network_images = (
  "img/pic_network_graph/network_plot_step_0.png",
  "img/pic_network_graph/network_plot_step_10.png",
  "img/pic_network_graph/network_plot_step_20.png",
  "img/pic_network_graph/network_plot_step_30.png",
  "img/pic_network_graph/network_plot_step_40.png",
  "img/pic_network_graph/network_plot_step_50.png",
  "img/pic_network_graph/network_plot_step_60.png",
  "img/pic_network_graph/network_plot_step_70.png",
  "img/pic_network_graph/network_plot_step_80.png",
  // "img/pic_network_graph/network_plot_step_90.png",
)

#let network_image_grid = grid(
  columns: 3,
  gutter: 10pt,
  ..network_images.map(img => image(img, width: 100%))
)

#figure(
  caption: [Network Evolution over Time from Step 0 to Step 80],
  network_image_grid
)

= Simulation and Results Analysis

== Design of the Experiment

// #import "./Tables/simulationPlan.typ": simPlan

#simPlan

#bibliography("references.bib")

#show: appendix
