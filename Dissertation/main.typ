#import "template.typ": *
#import "Tables/SimulationInfoTable.typ": simInfo
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

== Research Question

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

The ABM models contains three main components: agents, environment, and
interaction rules. 

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

Refer to @badham_developing_2018 and Gilbert's ABM specification sheet
@gilbert_abm_nodate for summarizing the ABM modeling process:

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

The setting of interaction rules, the selection of key parameters and the
verification of results of ABM are the core links in the modeling process. The
interaction rules are usually implemented by setting the behavior and
topological structure of the agent, including the "Soup" model, cellular
automata, Euclidean space, GIS and network topology @macal_agent-based_2009. The
key parameters cover the personal characteristics and environmental factors of
the agent @conte_agent-based_2014, and may also include specific belief
parameters @ramchurn_trust_2004. The result verification methods include
comparing the ABM simulation results with classical models or empirical data,
adopting multi-level verification methods (calibrating parameters at the micro
level and observing the reality of macro behavior) @conte_agent-based_2014, and
using social network analysis and participatory simulation to obtain information
about agent behavior and interaction. However, due to the complexity of ABM
models, verification and calibration remain one of the main challenges, and the
lack of standardized methods makes it difficult to interpret and analyze the
results.

=== Pros and Cons of ABM and its Applications

The main advantage of ABM is its powerful ability to simulate complex systems.
It can capture complex interactions between heterogeneous agents, observe
macro-emergent phenomena generated by micro-behavior @conte_agent-based_2014,
and provide an intuitive and realistic description of the system. The
flexibility of ABM enables it to easily adapt to different scenarios and
simulate the learning and adaptive behavior of agents @dorri_multi-agent_2018.
It supports multi-level modeling that simultaneously considers dynamics at the
individual, organizational and system levels. ABM is also spatially explicit,
able to simulate the movement and interaction of agents in specific environments
@davidsson_multi_2001. In addition, it provides generative explanations, can
improve efficiency through parallel computing, and can be integrated with other
modeling methods to enhance overall modeling capabilities.

However, ABM also faces some significant challenges and limitations. The most
prominent one is the difficulty of verification @zheng_primer_2013. Due to the
complexity of the model, it is difficult to fully verify the accuracy of the
results. ABM often requires powerful computing resources, especially for
large-scale or complex models @conte_agent-based_2014. It also requires large
amounts of detailed process data for calibration and validation, which increases
the difficulty of data collection. The complexity of parameter calibration and
the highly technical requirements of the model are also important constraints.
In addition, the complex interactions and emergent behaviors generated by ABM
can be difficult to interpret, running the risk of producing arbitrary and
inconsistent models. High computational cost, lack of unified modeling
standards, and the possibility of overfitting are important issues to consider
when using ABM. Despite these challenges, ABM remains a powerful tool for
studying complex systems, but its use requires careful weighing of these
advantages and disadvantages.

ABM has been widely used in multiple disciplines, demonstrating its strong
potential as an interdisciplinary research tool and its applicability in systems
of different scales and complexities, providing researchers with a powerful tool
to understand and predict complex social, economic, and natural phenomena
@macal_tutorial_2005.

#figure(caption: "Applications of ABM in Various Fields", table(
  columns: (auto, auto),
  align: (left, left),
  stroke: none,
  table.hline(),
  table.header([*Research Field*], [*Applications*]),
  table.hline(),
  [Social Sciences],
  [
    - Human behavior and social interactions
    - Economic systems and political processes
    - Organizational decision-making
    - Crime analysis and terrorism studies
  ],
  [Natural Sciences],
  [
    - Ecology and ecosystem dynamics
    - Cellular and molecular biology
    - Chemical reactions and processes
  ],
  [Public Health & Medicine],
  [
    - Epidemiology (infectious and non-communicable diseases)
    - Healthcare systems optimization
  ],
  [Engineering & Technology],
  [
    - Supply chain and manufacturing
    - Urban planning and transportation
    - Energy systems and power grids
  ],
  [Business & Economics],
  [
    - Market analysis and financial simulations
    - Trade networks and marketing strategies
  ],
  [Environment & Energy],
  [
    - Climate change impacts
    - Resource management and sustainability
  ],
  [Military & Security],
  [
    - Command systems and force simulations
    - Evacuation modeling
  ],
  [Complex Systems Science],
  [
    - Emergent behavior and adaptive systems
    - Multi-level system simulations
  ],
  table.hline(),
))

=== Application of ABM in complex systems and social science research

ABM has demonstrated its unique advantages in the study of complex systems and
can effectively reflect the complexity and adaptability of the system
@zheng_primer_2013. Through simple local rules, ABM can generate complex system
behaviors, such as the collective behaviors exhibited by the "Life" and "Boids"
models @macal_agent-based_2009. It can simulate multi-level systems, capture
complex interactions between individuals and between individuals and the
environment, and allow agents to adapt and change decisions over time
@badham_developing_2018. ABM can also simulate the properties of complex
adaptive systems (CAS), including nonlinearity, fluidity and diversity, as well
as feedback mechanisms in the system, which together constitute the complexity
and adaptability of the system @macal_tutorial_2005.

In social science research, ABM provides an innovative way to integrate social
science theory and computational methods. It applies decision theory in social
science (such as the BDI model) to the decision rules of agents
@zheng_primer_2013, and combines data mining and complex system modeling to
create the emerging field of computational social science. ABM can transform
behavioral theories into computable models and calibrate them using multiple
data sources. It integrates the theoretical foundations of multiple disciplines,
including complexity science, system science, and management science. Through
models such as SugarScape, ABM successfully simulates complex social processes
@macal_agent-based_2009. In addition, the application of ABM in trust models and
other fields demonstrates its ability to combine sociological concepts with
computational models. This interdisciplinary approach not only promotes the
development of social science theories, but also provides new perspectives and
tools for the study of complex social systems.

=== Theoretical contributions and future development of ABM

ABM's contribution to social science theory lies in its unique modeling and
analysis capabilities. It can directly simulate individual behaviors and
interactions, generate overall system behaviors, and provide a platform for
verifying theoretical hypotheses @conte_agent-based_2014. ABM reveals the
multi-level nature of social phenomena, demonstrates the dynamic process from
micro-behavior to macro-structure, and provides a new perspective on
long-standing problems. By introducing computational models, such as computable
trust measures, ABM improves traditional research methods and provides new
analytical tools and frameworks for social science theory
@macal_agent-based_2009.

The cutting-edge and interdisciplinary potential of ABM research is reflected in
many aspects. Its application in complex system research is constantly
expanding, especially in the study of self-organizing systems. ABM is being
integrated with methods such as data mining and machine learning to promote the
development of computational social science @davidsson_multi_2001. At the
theoretical level, ABM promotes in-depth research on rational agents and system
strategic structures. In the future, ABM is expected to make important
contributions in the formalization of social selection processes and the
standardization of intelligent agent systems, promote the deep integration of
social sciences with natural sciences and computational sciences, and open up
new prospects for complex system research @macal_agent-based_2009.

== Platforms and Building Philosophy of ABM

=== Platforms for ABM Development

ABM tools encompass a diverse range, including specialized platforms (e.g.,
NetLogo, GAMA), large-scale development environments (e.g., Repast, MASON),
commercial software (e.g., AnyLogic), and frameworks based on general-purpose
programming languages (e.g., Mesa for Python). The choice of tool depends on the
user's programming experience, project complexity, and specific requirements.
Pure ABM builders might find intuitive specialized tools like NetLogo more
suitable, while experienced programmers may prefer tools integrated with their
familiar languages. For projects requiring GIS integration or large-scale
simulations, tools such as GAMA or MASON might be more appropriate. If
scientific computing and graph theory related content are needed in the modeling
process, it is more appropriate to use the MESA package
@project_mesa_team_mesa_nodate.

=== Building Philosophy of ABM

Modeling plays a crucial role in scientific research, with diverse purposes
including prediction, explanation, and description. Edmonds emphasize the
importance of clarifying model purposes, as this influences modeling and
validation strategies @edmonds_different_2019. In terms of modeling strategies,
KISS (Keep It Simple, Stupid) and KIDS (Keep It Descriptive, Stupid) represent
two distinct approaches. KISS aims for simplicity, while KIDS emphasizes
descriptiveness and extensive evidence. Both strategies have their advantages
and disadvantages, and the choice depends on factors such as research objectives
and phenomenon complexity. As computational power increases and complex systems
research advances, KIDS may gain favor in certain fields @edmonds_kiss_2005.
However, regardless of the chosen strategy, it is crucial to clearly define the
model's purpose and demonstrate its applicability. Researchers should flexibly
select strategies based on specific circumstances to construct the most
effective models.

Bottom-up ABM starts from the micro-level, defining agents' attributes,
behavioral rules, and interactions to simulate complex system dynamics
@rixon_bottom-up_2005. This approach allows macro-level phenomena to emerge
naturally from micro-level interactions, capturing the heterogeneity and
adaptivity of the system @nageli_towards_2020. By constructing models from the
individual level, ABM provides a unique perspective for understanding and
explaining complex systems, demonstrating the advantages of bottom-up modeling
approaches.

With the improvement of computing power, ABM may play an increasingly important
role in social sciences. Rand proposed a guiding framework for rigorous use of
agent-based modeling (ABM) in research, including using some existing model
frameworks, determining the applicability of ABM, designing and building models,
and model verification and validation @rand_agent-based_2011.

UML also enhances Agent-Based Modeling by providing higher abstraction, improved
readability, and better modularity. It facilitates communication, documentation,
and design pattern application while being language-independent. UML captures
dynamic behaviors, promotes efficient modeling, and encourages professional
practices, ultimately improving ABM quality and maintainability
@bersini_uml_2011.

== Diffusion of Innovation and Bass Model

=== Innovation Diffusion Theory

Innovation diffusion theory, proposed by Rogers @rogers_new_1976, the process of
people accepting a new product usually follows the product life cycle theory and
can be divided into several stages: introduction, growth, maturity and decline.
In the introduction stage, only a few innovators (about 2.5% of the population)
and early adopters (about 13.5%) will try the new product. As time goes by, the
product enters the growth stage and more early majority (about 34%) begin to
adopt it. In the maturity stage, most potential users (late majority about 34%)
have adopted the product and the market tends to be saturated. Finally, it
enters the decline stage, with only a few laggards (about 16%) still adopting it
@chesbrough_beyond_2006. The adoption process at the individual level includes
stages such as cognition, interest, evaluation, trial and final adoption
@everett_m_rogers_diffusion_2003. Different types of consumers have different
adoption times and can be divided into groups such as innovators, early
adopters, early majority, late majority and laggards @diederen_innovation_2003.

=== Bass Diffusion Model

Innovation diffusion models are used to describe and predict the process by
which new products or technologies are gradually accepted and popularized in
society. The most famous and widely used model is the Bass diffusion model
@bass_new_1969. Since Frank Bass proposed the new product diffusion model in
1969, the Bass model has had a profound impact on the research of new product
adoption and technology diffusion @admin_bass_nodate. The model describes the
diffusion process of new products through a simple differential equation:
$ "dF"(t) / "dt" = (p + q F(t))(1 - F(t)) $

where F(t) represents the cumulative adopter ratio, and p and q represent the
innovation and imitation coefficients, respectively.

The solutuion of the Bass model is:
$F(t) = 1 - exp(-(p + q)t) / (1 + q/p exp(-(p + q)t))$

The sales volume S(t) can be expressed as:
$"S"(t) = "m" "dF"(t) / "dt"$

The core assumption of the Bass model is that the adoption of new products is
the result of innovation and imitation, and the adoption probability is linearly
related to the number of adopters @boswijk_econometrics_2005.

The literature shows that the main advantage of the Bass model is that it can
accurately predict the S-shaped curve and sales peak of new product sales, and
the model parameters have a clear market interpretation. Although originally
developed for durable consumer goods, subsequent studies have confirmed that the
model is applicable to a wide range of product and service categories, including
technology products and B2B market @massiani_choice_2015.

The following figure uses pure Python to simulate the acceptance process of a
product by 1000 potential users (p = 0.03, q = 0.38) and visualize the results
using Matplotlib:

#figure(
  caption: link(
    "https://github.com/QianZeHao123/MDS-Research-Project/blob/main/ABM%20version%200.1/purebass.ipynb",
  )[
    Bass Model Simulation with Python NumPy and Matplotlib
  ],
  image("img/pic_bass_py_sim/bassmodelsim.png", width: 100%),
)


The influence of the Bass model is reflected in the fact that it has become the
basis of many extended models. For example, the intergenerational diffusion
model and the generalized Bass model developed by Bass are important
developments based on the original model. These extensions further improve the
scope of application and predictive power of the model.

=== Apply ABM methods into the Bass model

ABMs offer significant advantages for modeling innovation diffusion compared to
traditional aggregate approaches. As illustrated in the reviewed papers, ABMs
can capture heterogeneity among agents, such as different consumer types in
electric vehicle adoption models @mehdizadeh_systematic_2022 or varying farmer
characteristics in agricultural innovation studies @kiesling_agent-based_2012.
They explicitly model interactions and social networks, like word-of-mouth
effects in movie-going behavior @ratna_social_nodate or peer influence in solar
panel adoption @rand_agentbased_2021. ABMs reveal emergent phenomena from
micro-level behaviors, as seen in the diffusion of organic farming practices.
They provide flexibility to incorporate various decision rules, spatial effects,
and qualitative factors, exemplified by models integrating psychological
theories like the Theory of Planned Behavior. By enabling analysis at both
individual and aggregate levels, ABMs facilitate policy experimentation, as
demonstrated in studies on energy technology adoption @nageli_towards_2020 and
electric vehicle diffusion @zhang_empirically_2019. This approach allows for
more realistic representation of complex social dynamics in innovation
diffusion, providing valuable insights for both theoretical understanding and
practical decision support.

== Influencers and Opinion Leaders in Diffusion

Influencers or opinion leaders are nodes in social networks that have a
particularly important influence on the spread of information. They usually
account for about 10% of network users, have a high degree of connectivity in
the network, and play a key role in the widespread dissemination of information
@turnbull_diffusion_1980. Studies have found that the probability of
dissemination (p_op) of opinion leaders is often a key factor in successfully
simulating the spread of real-world information @feder_role_2006. Ideally, early
adopters are also opinion leaders, so that information can be spread most
effectively. In general, influencers are widely connected and influential nodes
in social networks, and play a disproportionately important role in the
widespread dissemination of information @li_abem_2021.

== Network Structure and Diffusion

=== Network topological structure

Several studies have shown that different network topologies have a significant
impact on information dissemination. By comparing the information diffusion
effect of priority connection network, random network, small world network and
lattice network in ABM simulation. It was found that structural characteristics
such as average degree, clustering coefficient and average path length of the
network are closely related to the speed and scope of information propagation.
For example, small-world networks tend to exhibit faster information propagation
speeds due to their high clustering and short average path lengths
@bohlmann_effects_2010.

Chen further explored the selection strategies of early adopters (seed nodes)
under different network structures @chen_agent-based_2019. The study found that
the most effective early adopter identification methods may be different in
different network structures. For example, the degree discount algorithm
performs well in most networks, while the greedy algorithm works better in grid
networks.

=== Node Heterogeneity and Opinion Leaders

Smith and Burow emphasize the importance of considering node heterogeneity for
accurately modeling information propagation. They proposed an extended Bass
diffusion model that divided nodes into different connectivity categories and
took into account the correlation between nodes @smith_using_2020. Research
shows that highly connected nodes (so-called "opinion leaders") play a key role
in information dissemination, especially in the early stages of information
dissemination.

Xue used ABM to study the spread of immunization policies in social networks.
Their model considered the influence of opinion leaders and found that targeted
publicity targeting opinion leaders can significantly improve the efficiency of
information dissemination @xue_simulation_2016.

== Conclusion of Literature Review

By collating the literature review, the following ideas inspired my research
report:
- ABM is a powerful tool for simulating complex systems and social phenomena,
  providing a bottom-up approach to understanding emergent behaviors.
- The Bass diffusion model is widely used in innovation diffusion research, and
  ABMs offer advantages for modeling innovation diffusion compared to traditional
  aggregate approaches.
- KISS and UML enhance ABM modeling by emphasizing simplicity and abstraction,
  respectively.
- Influencers and opinion leaders play a key role in information dissemination,
  and network structure and node heterogeneity significantly impact diffusion
  processes. Influencers mean they have more connections in the social network.
- Network topological structure, node heterogeneity, and opinion leaders are
  important factors in information diffusion, and ABMs can capture these dynamics
  effectively.

= Methodology

== Statement of research objectives

This study is based on the theoretical foundation of the Bass diffusion model
and combines the Agent-Based Modeling method to simulate the market diffusion
process. The Bass model provides us with a theoretical framework to describe the
diffusion process of innovative products in the market, which takes into account
the role of external influences (such as advertising) and internal influences
(such as word of mouth) on potential adopters. ABM allows us to simulate the
behavior and interaction of individual consumers at the micro level, thereby
exploring the various factors that affect the diffusion process at a more
detailed scale.

By combining the macro-forecasting capabilities of the Bass model with the
micro-simulation advantages of ABM, this study aims to gain a more comprehensive
and in-depth understanding of the diffusion dynamics of new products in the
market. This approach allows us to consider factors such as individual
differences, social network structure, and market heterogeneity while
maintaining a grasp of overall market trends.

The following are my research proposals:
+ Study on the relationship between the probability distribution of individual
  acceptance of new products in the market and the product diffusion rate: Explore
  the impact of different acceptance probability distributions on the overall
  market diffusion process.
+ Analysis of the role of innovators and opinion leaders in product diffusion:
  Study how the proportion of innovators and influential opinion leaders who
  spontaneously accept new products affects the market penetration and diffusion
  speed of products.
+ Research on the impact of consumer group heterogeneity on product diffusion:
  Analyze the impact of the proportion of different types of consumer groups in
  the market on the diffusion of product acceptance, and explore the potential
  impact of the absence of a specific type of consumer group on the diffusion
  process.
+ Evaluating the impact of market size on product diffusion dynamics: Studying how
  different sizes of potential user groups affect the final diffusion rate and
  saturation level of a product.
+ Analysis of the impact of social network structure on product diffusion
  dynamics: Study how different types of social network structures (such as
  small-world networks, scale-free networks, random networks, etc.) affect the
  spread and adoption speed of product information, as well as the relationship
  between these network characteristics and key indicators of the diffusion
  process (such as diffusion rate, peak time, saturation level, etc.).

== Model framework introduction

=== Model structure

My ABM model is developed with MESA, using object-oriented programming, and
consists of two main classes: BassModel and BassAgent. The BassModel class
defines the overall model structure, including the network environment, agent
creation, and data collection. The BassAgent class defines the properties and
behaviors of individual agents.

#figure(
  image("img/abm_model/class.png", width: 50%),
  caption: "Class Diagram of the ABM Model",
)

=== Agent Attributes

Each agent represents a potential consumer in the market and has the following
key attributes:
- Basic attributes:
  - Unique identifier (unique_id): used to distinguish different agents.
  - Adoption status (adopted): Boolean value, indicating whether the agent has
    adopted the product
- Type Attributes:
  - Consumer type (agent_type): divided into "Innovator" or "Imitator"
    - Innovators: tend to adopt new products independently, and the adoption
      probability is determined by parameter p
    - Imitator: The adoption decision is influenced by others in the social network,
      and the adoption probability is determined by the parameter q and the proportion
      of neighbors that have adopted.
  - Influencer: Boolean value, divided into influential (influencer) and
    non-influencer (non-influencer)
    - Influential agents have more connections in the network, representing opinion
      leaders or key nodes in the diffusion process.
    - Non-influential agents represent ordinary consumers.
- Social network characteristics: Neighbors: A list of other agents that an agent
  is directly connected to in the social network.

=== Social Network Structure

This model simulates the interconnection and influence between consumers through
different social network structures. The network structure has an important
impact on the information dissemination and product adoption process. The model
supports 2 typical network types (small world and random network).

The following table summarizes the key characteristics of the two network:

#figure(
  caption: "Comparison of Random and Small-World Network Models",
  table(
    columns: (auto, auto, auto),
    align: (left, left, left),
    stroke: none,
    table.hline(),
    table.header([Characteristics], [Random Network], [Small-World Network]),
    table.hline(),
    [Implementation Method],
    [Erdős-Rényi model],
    [Watts-Strogatz model],
    [Function],
    [nx.erdos_renyi_graph],
    [nx.watts_strogatz_graph],
    [Features],
    [Fixed probability p of connection between each pair of nodes],
    [High clustering coefficient and low average path length, simulating "six degrees
      of separation"],
    [Parameters],
    [
      - n: number of nodes
      - p: connection probability (0.05 in this model)
    ],
    [
      - n: number of nodes
      - k: number of neighbors for each node (4 in this model)
      - p: rewiring probability (0.1 in this model)
    ],
    [Potential Impact],
    [Simulates completely random social relationships, may lead to relatively uniform
      information diffusion],
    [May result in rapid local diffusion and relatively fast global information
      spread],
    [Mathematical Expression],
    [
      - P(edge) = p for any two nodes
      - Average degree = $p(n-1)$
      - Graph is almost certainly connected when $p > ln(n)/n$
    ],
    [
      - $C approx (3(k-2))/(4(k-1))$
      - $L prop log(n)/log(k)$
      - Maintains high clustering coefficient while reducing average path length through
        long-distance connections
    ],
    table.hline(),
  ),
)

The figure shows the network structure of a small-world network with 100
nodes(agents), we can see that the random network has a higher clustering
coefficient and a shorter average path length compared to the small world
network: 

#figure(
  image("img/abm_model/network.png", width: 100%),
  // caption: "Random and Small-World Network Structures",
  caption: link(
    "https://github.com/QianZeHao123/MDS-Research-Project/blob/main/ABM%20version%200.1/network.ipynb",
  )[
    Random and Small-World Network Structures
  ],
)

=== Diffusion mechanism

We hypothesize that new product adoption is influenced by two main factors:
- External influence (innovation effect): from external information sources such
  as advertising and media.
- Internal influence (imitation effect): from the adoption behavior of other
  consumers in the social network.

So in each time step, the adoption probability of an agent is determined by:
- For innovators $p$: Agents independently adopt products with fixed probability
  p.
- For imitators $q$: Agents are influenced by the adoption behavior of their
  neighbors, and the adoption probability is determined by the proportion of
  neighbors who have adopted the product. The equation is ($N$ means neighbors):
  $ p_"adopt" = q times N_"Adopted" / N_"Total" $

=== Model Parameters

This ·Model contains several key parameters that together define the behavior
and characteristics of the model. The following is a detailed description of
these parameters:

#figure(
  caption: "Model Parameters for Agent-Based Bass Diffusion Model",
  table(
    columns: (auto, auto, auto),
    align: (left, left, left),
    stroke: none,
    table.hline(),
    table.header([*Parameter*], [*Description*], [*Impact*]),
    table.hline(),
    [*Basic Parameters*],
    [],
    [],
    [N],
    [Total number of agents (consumers)],
    [Determines market size, affects network complexity and computation time],
    [p],
    [Innovation coefficient (0.01 to 0.03)],
    [Higher values accelerate innovators adoption],
    [q],
    [Imitation coefficient (0.3 to 0.5)],
    [Higher values accelerate imitators adoption],
    table.hline(),
    [*Agent Type Distribution*],
    [],
    [],
    [agent_proportion],
    [List of four values representing proportions of:
      1. Influential innovators
      2. Influential imitators
      3. Non-influential innovators
      4. Non-influential imitators],
    [Determines market composition, affecting overall diffusion dynamics],
    table.hline(),
    [*Network Structure*],
    [],
    [],
    [network_type],
    [Options: "random", "small_world", "scale_free"],
    [Different structures lead to varied information spread patterns],
    [p_random],
    [Connection probability for random networks (default: 0.05)],
    [Affects connectivity in random networks],
    [k],
    [Number of neighbors per node for small-world networks (default: 4)],
    [Influences local clustering in small-world networks],
    [p_rewire],
    [Rewiring probability for small-world networks (default: 0.1)],
    [Affects "small-world-ness" of the network],
    [m],
    [Number of edges added per new node in scale-free networks (default: 2)],
    [Influences hub formation in scale-free networks],
    table.hline(),
    [*Influence Parameter*],
    [],
    [],
    [Extra connections],
    [30 to 55 additional connections for influential agents],
    [Simulates the broad influence of opinion leaders],
    table.hline(),
  ),
)

== Run the ABM Model

=== Initialize the Model

The following pseudocode outlines the core initialization process for our
Agent-Based Model (ABM) of product diffusion. This initialization sets up the
fundamental structures and parameters necessary for simulating the Bass
diffusion model in a network context. The code demonstrates how we establish the
agent population, create the social network, and prepare the model for
simulation runs.

#import "@preview/algorithmic:0.1.0"
#import algorithmic: algorithm

#algorithm(
  {
    import algorithmic: *
    Function(
      "Initialize-Model",
      args: ("N", "p", "q", "agent_proportion", "network_type"),
      {
        Cmt[Initialize core parameters and structures]
        Assign[total_agents][N]
        Assign[innovation_coefficient][p]
        Assign[imitation_coefficient][q]
        State[Create social network based on network_type]
        State[Generate agent distribution list]
        State[]
        Cmt[Create and place agents]
        For(cond: [$i = 0$, $N-1$], {
          State[Create new BassAgent with properties from distribution list]
          State[Add agent to network and scheduler]
        })
        State[]
        Cmt[Enhance network for influential agents]
        For(cond: [each influential agent], {
          State[Add extra connections]
        })
        State[]
        Cmt[Initialize tracking variables]
        Assign[steps_to_key_percentages][None]
        Assign[running][True]
        State[]
        Return[Initialized model]
      },
    )
  },
)

Here is the detialed network initialization process of the ABM model:

#figure(
  image("img/abm_model/network_init.png", width: 100%),
  caption: "Initialization of the ABM Model Network",
)

=== Scheduler and Barch Running with MESA

Schedulers play a key role in Agent-Based Models. I chose to use the
RandomActivation scheduler provided by Mesa. The main reason for using a
scheduler is to manage and control the order in which agents in the model are
activated. At each simulation step, the RandomActivation scheduler randomly
decides the order in which to activate agents. This randomness is important
because it helps avoid systematic biases that may be introduced by a fixed
activation order. In the real-world product diffusion process, the order in
which consumers make decisions is often not fixed, and using random activations
can better simulate this uncertainty. In addition, the scheduler simplifies the
time management of the model, allowing us to easily iterate over all agents at
each time step, update their states, and collect relevant data. By creating a
scheduler instance at model initialization and calling `self.schedule.step()` to
activate all agents at each time step, we ensure that the model runs
consistently and controllably. This approach is particularly suitable for
simulating social processes that do not have a fixed order, such as our product
diffusion model, allowing us to more accurately capture complex market dynamics.

Batch Running is the core method of model analysis. Using Mesa's BatchRunner, we
are able to systematically explore the impact of different parameter
combinations on product diffusion. This method allows us to define parameter
ranges (such as innovation coefficient, and imitation coefficient), perform
multiple repeated simulations, and automatically collect data. Through batch
running, we can conduct sensitivity analysis, understand how different market
conditions affect product adoption, identify key parameters and critical points,
and predict diffusion trends under various scenarios. This method greatly
enhances our understanding and prediction capabilities of the product diffusion
process and provides strong empirical support for market strategies.

=== Data Collection

Data collection is essential for analyzing both individual agent behaviors and
overall system dynamics. We employ Mesa's `DataCollector()`, a tool that enables
systematic gathering of both agent-level and model-level data. This dual-level
approach allows us to track individual agent decisions and characteristics while
also monitoring system-wide trends. The DataCollector efficiently gathers
time-series data throughout the simulation, providing insights into the temporal
dynamics of the diffusion process. This comprehensive data collection
facilitates model validation, sensitivity analysis, and the exploration of
emergent phenomena in product adoption patterns, enhancing our understanding of
the complex diffusion process.

#figure(
  caption: "Data Collection in the Agent-Based Bass Diffusion Model",
  table(
    columns: (auto, auto, auto),
    align: (left, left, left),
    stroke: none,
    table.hline(),
    table.header([*Level*], [*Data Collected*], [*Description*]),
    table.hline(),
    [*Agent-level*],
    [Adopted],
    [Whether each agent has adopted the product],
    [],
    [Influencer],
    [Whether each agent is an influential individual],
    [],
    [Agent_Type],
    [Innovator or Imitator],
    [],
    [Neighbors],
    [List of neighbors for each agent],
    [],
    [Neighbors_number],
    [Number of neighbors for each agent],
    table.hline(),
    [*Model-level*],
    [Adopted_Count],
    [Total number of agents who have adopted the product],
    [],
    [Influencer_Count],
    [Number of influential agents who have adopted the product],
    [],
    [Non_Influencer_Count],
    [Number of non-influential agents who have adopted the product],
    [],
    [Innovator_Count],
    [Number of innovators who have adopted the product],
    [],
    [Imitator_Count],
    [Number of imitators who have adopted the product],
    [],
    [Steps_to_X_percent],
    [Time steps required to reach 25%, 50%, and 75% adoption rates],
    table.hline(),
  ),
)

= Simulation and Results Analysis

== Design of the Experiment

Split the experiment into different groups, each with specific parameters
changed, and run batch simulations.

// #simInfo

== Visualization of Network Evolution

Use the network graph to visually track whether an agent is activated at any
time.

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
  ..network_images.map(img => image(img, width: 100%)),
)

#figure(
  caption: [Network Evolution over Time from Step 0 to Step 80],
  network_image_grid,
)

== Table of Neighbors between Influencers and Non-Influencers

The tables below shows the average, maximum, and minimum values of the number of
influencer and non-influencer neighbors in the first five simulations. The
number of neighbors of an influencer is approximately four to six times that of
a flying influencer.

#figure(caption: "Run Data for Agent-Based Model", table(
  columns: (auto, auto, auto, auto, auto, auto, auto),
  align: (left, center, center, center, center, center, center),
  stroke: none,
  table.hline(),
  table.header(
    [*RunId*],
    [*Inf Mean*],
    [*INF Max*],
    [*Inf Min*],
    [*Non-inf Mean*],
    [*Non-inf Max*],
    [*Non-inf Min*],
  ),
  table.hline(),
  [0],
  [49.09],
  [62],
  [37],
  [8.132222],
  [17],
  [3],
  [1],
  [49.83],
  [69],
  [36],
  [8.152222],
  [15],
  [3],
  [2],
  [50.24],
  [65],
  [35],
  [8.215556],
  [16],
  [3],
  [3],
  [50.83],
  [64],
  [36],
  [8.283333],
  [17],
  [3],
  [4],
  [49.87],
  [65],
  [37],
  [8.11],
  [17],
  [3],
  table.hline(),
))

== Research on Different Probability of Innovators Adoption

#let p_images = (
  "img/pic_p_change_research/box.png",
  "img/pic_p_change_research/combined_plot.png",
)

#let p_image_grid = grid(
  columns: 2,
  gutter: 10pt,
  ..p_images.map(img => image(img, width: 100%)),
)

#figure(
  caption: [Boxplot and Line Plot of Different Innovator Adoption Probabilities],
  p_image_grid,
)

== Research on Different Probability of Imitators Adoption

#let q_images = (
  "img/pic_q_change_research/box.png",
  "img/pic_q_change_research/combined_plot.png",
)

#let q_image_grid = grid(
  columns: 2,
  gutter: 10pt,
  ..q_images.map(img => image(img, width: 100%)),
)

#figure(
  caption: [Boxplot and Line Plot of Different Imitator Adoption Probabilities],
  q_image_grid,
)

== Research on the Impact of Fixed Influencial proportion

#figure(
  caption: [Keep the influential innovators' proportion changed when the innovator
    proportion is fixed],
  image("img/pic_same_inf_prop_research/box.png", width: 100%),
)

== Research on the Impact of Fixed Innovator's proportion

#figure(
  caption: [Keep the influential innovators' proportion changed when the influential
    proportion is fixed],
  image("img/pic_same_inno_prop_research/box.png", width: 100%),
)

== Change on the Innovators and Innovator proportion

// pic_p_prop_inno_research
#let p_prop_inno_images = (
  "img/pic_p_prop_inno_research/step_to_25.png",
  "img/pic_p_prop_inno_research/step_to_50.png",
  "img/pic_p_prop_inno_research/step_to_75.png",
)

#let p_prop_inno_image_grid = grid(
  columns: 3,
  gutter: 10pt,
  ..p_prop_inno_images.map(img => image(img, width: 100%)),
)

#figure(
  caption: [Steps to Reach 25%, 50%, and 75% Adoption Rates with Different Innovator's P and
    Innovator's Proportion],
  p_prop_inno_image_grid,
)

== Change on Proportion of Influencers and Innovators

// pic_prop_inno_inf_research
#let prop_inno_inf_images = (
  "img/pic_prop_inno_inf_research/step_to_25.png",
  "img/pic_prop_inno_inf_research/step_to_50.png",
  "img/pic_prop_inno_inf_research/step_to_75.png",
)

#let prop_inno_inf_image_grid = grid(
  columns: 3,
  gutter: 10pt,
  ..prop_inno_inf_images.map(img => image(img, width: 100%)),
)

#figure(
  caption: [Steps to Reach 25%, 50%, and 75% Adoption Rates with Different Innovator's
    Proportion and Influencer's Proportion],
  prop_inno_inf_image_grid,
)

= Conclusion

== Summary of Findings

== Contributions and Implications

== Limitations and Future Research

#bibliography("references.bib")

#show: appendix
