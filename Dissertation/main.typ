#import "template.typ": *
#import "Tables/SimulationInfoTable.typ": simInfo
#import "@preview/algorithmic:0.1.0"
#import algorithmic: algorithm
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
  abstract: [This study based on Bass diffusion theory, combined with Agent-based modeling
    and complex network theory, to explore the diffusion dynamics of innovative
    products in the market. The research focuses on the impact of individual
    behavior, social network structure, and market composition on the diffusion
    process, aiming to provide deeper insights than traditional aggregation models.
    We construct a flexible simulation framework that integrates key factors such as
    innovation coefficient, imitation coefficient, proportion of consumer types, and
    different social network structures. Through systematic parameter adjustments
    and multiple simulations, the study reveals how these factors influence the
    diffusion process individually and interactively. Results show that the ratio of
    innovators to influential individuals has a significant impact on early adoption
    rates, while social network structure moderates the speed and scope of
    information dissemination. We also discovered "critical points" for certain
    parameter combinations, beyond which the diffusion rate increases dramatically.
    Furthermore, research highlights the importance of considering consumer
    heterogeneity and network effects in accurately predicting market dynamics.],
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

// add word count to the end of the document 
#import "@preview/wordometer:0.1.2": word-count, total-words
#show: word-count

= Introduction and Research Question

== Introduction

== Research Background
In today's rapidly changing market environment, understanding the diffusion
process of new products and innovative ideas is crucial for companies and
policymakers. Traditional diffusion models, such as the Bass model, provide us
with valuable insights at the macro level, but often fail to capture the
complexity and diversity of individual behaviors at the micro level. With the
increasing popularity and influence of social networks, the interaction and
information dissemination between consumers have become more complex and
dynamic. In this context, combining traditional diffusion theory with modern
computational methods, especially using agent-based models (ABM) to simulate
market diffusion processes, has become a very promising research direction.

== Research Objectives

This study aims to build an innovative market diffusion simulation framework
that integrates the theoretical foundation of the Bass diffusion model and the
micro-simulation capabilities of ABM. This integrated approach allows us to
simulate the behavior and interactions of individual consumers more finely,
while considering both external influences and internal influences. Our model
specifically introduces the key attribute of "influencers" to improve the
representation of agent heterogeneity and to be closer to the role distribution
in real social networks. In addition, this study embeds agents in different
types of network structures, aiming to deeply explore the impact of social
network topology on the innovation diffusion process.

== Research Significance

This research is of great significance at both theoretical and practical levels:

- Theoretical level: This study provides a new analytical framework for innovation
  diffusion research by integrating traditional diffusion theory and modern
  computational methods. This not only helps bridge the gap between macroscopic
  diffusion models and microscopic individual behavior, but also provides a new
  perspective for our understanding of emergent behavior in complex systems.
- Practical level: For businesses and policymakers, more accurately predicting and
  understanding the innovation diffusion process can bring significant economic
  and social benefits. The results of this study can help companies optimize their
  market strategies and more effectively identify and utilize key influencers,
  thereby accelerating the market penetration of new products. For policymakers,
  these insights can guide them to formulate more targeted innovation policies and
  promote technological progress and economic development of the entire society.

== Research Questions

This study aims to explore the following key issues: the relationship between
the probability distribution of individual acceptance in the market and the
product diffusion rate; the role of innovators and opinion leaders in product
diffusion; the impact of consumer group heterogeneity on product diffusion; the
interaction of multiple factors (such as innovation coefficient, imitation
coefficient, proportion of innovators, proportion of influencers) on product
diffusion; and the impact of social network structure on product diffusion
dynamics. By studying these issues, we hope to fully understand the innovation
diffusion process in a complex market environment and provide valuable insights
for theoretical research and practical applications.

== Structure of the Report

This research report is structured as follows:
- Literature Review (@label:LiteratureReview): This section provides a
  comprehensive review of the literature on innovation diffusion theory, the Bass
  model, agent-based modeling, and network diffusion. It also discusses the
  limitations of the Bass model and the advantages and challenges of ABM.
- Methodology (@label:Methodology): This section introduces the model framework,
  agent attributes, social network structure, and diffusion mechanism of the ABM
  model for market diffusion research. It also presents the simulation plan design
  and the implementation of the ABM model using the Mesa framework.
- Simulation Results (@label:SimulationResults): This section presents the
  simulation results of the ABM model for market diffusion research, including the
  impact of individual behavior, social network structure, and market composition
  on the diffusion process. It also discusses the interactive effects of multiple
  factors on product diffusion dynamics.
- Discussion (@label:Discussion): This section analyzes the simulation results,
  interprets the findings, and discusses the implications for innovation diffusion
  research and practical applications. It also highlights the research
  contributions and limitations.

= Literature Review <label:LiteratureReview>

This section presents the literature review part of the report and serves as the
theoretical foundation for all subsequent research. In @label:DiffusionLiter, we
introduce the Bass model and discuss its limitations. Following this, we explore
agent-based modeling and its applications in complex systems and social science
research in @label:LiterABM. @label:networkDiffusionLiter focuses on network
structure and the role of influencers in innovation diffusion. We then examine
the application of ABM methods to the Bass model in @label:applyABM. Finally,
@label:conclusionLiter summarizes the literature review, leading to the research
questions proposed in @label:questions.

== Diffusion of Innovation and Bass Model <label:DiffusionLiter>

=== Innovation Diffusion Theory

According to innovation diffusion theory, proposed by Rogers @rogers_new_1976,
the process of people accepting a new product usually follows the product life
cycle theory and can be divided into several stages: introduction, growth,
maturity and decline. In the introduction stage, only a few innovators (about
2.5% of the population) and early adopters (about 13.5%) will try the new
product. As time goes by, the product enters the growth stage and more early
majority (about 34%) begin to adopt it. In the maturity stage, most potential
users (late majority about 34%) have adopted the product and the market tends to
be saturated. Finally, it enters the decline stage, with only a few laggards
(about 16%) still adopting it @chesbrough_beyond_2006. The adoption process at
the individual level includes stages such as cognition, interest, evaluation,
trial and final adoption @everett_m_rogers_diffusion_2003. Different types of
consumers have different adoption times and can be divided into groups such as
innovators, early adopters, early majority, late majority and laggards
@diederen_innovation_2003.

=== Bass Diffusion Model

Innovation diffusion models are used to describe and predict the process by
which new products or technologies are gradually accepted and popularized in
society. The most famous and widely used model is the Bass diffusion model
@bass_new_1969. Since Frank Bass proposed the new product diffusion model in
1969, the Bass model has had a profound impact on the research of new product
adoption and technology diffusion. 

In Bass's diffusion model, p (innovation coefficient) and q (imitation
coefficient) are two basic parameters. P is the probability that a potential
user will adopt the innovation independently, reflecting external influences
(such as advertising) and early adopter behavior, and is usually small
(0.01-0.03). And q is the probability that a potential user will adopt the
innovation under the influence of existing users, reflecting internal influences
(such as word of mouth) and copycat behavior, and is usually large (0.3-0.5).

The model describes the diffusion process of new products through a simple
differential equation (@label:bass):

$ "dF"(t) / "dt" = (p + q F(t))(1 - F(t)) $ <label:bass>

where F(t) represents the cumulative adopter ratio, and p and q represent the
innovation and imitation coefficients, respectively. 

The solutuion of the Bass model is (@label:bassfull):
$ F(t) = 1 - exp(-(p + q)t) / (1 + q/p exp(-(p + q)t)) $ <label:bassfull>

The sales volume S(t) can be expressed as (@label:sales):
$ "S"(t) = "m" "dF"(t) / "dt" $ <label:sales>

The core assumption of the Bass model is that the launch of new products is the
result of innovation and imitation, and the probability of launch is linearly
related to the number of adopters. @boswijk_econometrics_2005.

The literature shows that the main advantage of the Bass model is that it can
accurately predict the S-shaped curve and sales peak of new product sales, and
the model parameters have a clear market interpretation. Although originally
developed for durable consumer goods, subsequent studies have confirmed that the
model is applicable to a wide range of product and service categories, including
technology products and B2B market @massiani_choice_2015.

The following figure uses pure Python to simulate the acceptance process of a
product by 1000 potential users (p = 0.03, q = 0.38) and visualize the results
using Matplotlib (@label:NumPyRes):

#figure(
  caption: [
    Visualization of Bass Model Simulation with Python
    #link(
      "https://github.com/QianZeHao123/MDS-Research-Project/blob/main/ABM%20version%200.1/purebass.ipynb",
    )[[Code]]
  ],
  image("img/pic_bass_py_sim/bassmodelsim.png", width: 100%),
) <label:NumPyRes>


The influence of the Bass model is reflected in the fact that it has become the
basis of many extended models. For example, the intergenerational diffusion
model and the generalized Bass model developed by Bass are important
developments based on the original model @kim_bass_2015. These extensions
further improve the scope of application and predictive power of the model.

=== Limitations of the Bass Model

Although the Bass model proposes a good equation to describe market diffusion,
it still has some obvious limitations. First, the model is based on the
assumption of homogeneity, treating all potential adopters equally and ignoring
the diversity of individual decisions in the actual market. Second, the Bass
model assumes that the population is fully mixed and each individual can
influence others equally, thus ignoring the complex structure of real social
networks. In addition, because the model operates at the aggregate level, it
cannot capture the decision-making process and dynamics at the individual level.
Finally, the Bass model oversimplifies the adoption process and does not reflect
the many complex factors that affect the diffusion of innovation in the real
world @kumar_bass_nodate. These limitations make the traditional Bass model
potentially challenging in explaining and predicting certain market phenomena,
especially when individual differences, social network structures, and complex
adoption decisions need to be considered.

== Agent-based Modelling and Simulation <label:LiterABM>

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

In the ABM modeling process, the setting of interaction rules, the selection of
key parameters and the verification of results are the core links. The
interaction rules are usually implemented by setting the behavior and topology
of the agent, including the "soup" model, cellular automaton, Euclidean space,
GIS and network topology @macal_agent-based_2009. The key parameters cover the
personal characteristics and environmental factors of the agent
@conte_agent-based_2014, and sometimes also include specific belief parameters
@ramchurn_trust_2004.

There are various methods for verifying the results: ABM simulation results can
be compared with classical models or empirical data, multi-level verification
methods can be used (calibrating parameters at the micro level and observing the
authenticity of macro behavior) @conte_agent-based_2014, or social network
analysis and participatory simulation can be used to obtain agent behavior and
interaction information.

However, the complexity of ABM models makes verification and calibration still a
major challenge. The lack of standardized methods also increases the difficulty
of result interpretation and analysis. These issues still need to be further
explored and resolved by researchers.

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
important of these is the difficulty of validation @zheng_primer_2013. Due to
the complexity of the model, it is difficult to fully verify the accuracy of the
results. ABM usually requires powerful computing resources, especially for
large-scale or complex models @conte_agent-based_2014. In addition, calibration
and validation require a large amount of detailed process data, which makes data
collection difficult. The complexity of parameter calibration and the high
technical requirements of the model are also important limitations. In addition,
the complex interactions and emergent behaviors produced by ABM can be difficult
to interpret, and there is a risk of creating arbitrary and inconsistent models.
The high computational cost, the lack of unified modeling standards, and the
possibility of overfitting are important aspects to consider when using ABM.
Despite these challenges, ABM remains a powerful tool for studying complex
systems, but its use requires careful weighing of these advantages and
disadvantages.

ABM has been widely used in multiple disciplines, demonstrating its strong
potential as an interdisciplinary research tool and its applicability in systems
of different scales and complexities, providing researchers with a powerful tool
to understand and predict complex social, economic, and natural phenomena
@macal_tutorial_2005.

=== Application of ABM in complex systems and social science research

With the improvement of computing power, ABM is increasingly used in social
sciences. Rand proposed a guiding framework for the rigorous use of ABM,
covering key steps such as model selection, applicability assessment, design
construction and verification @rand_agent-based_2011.

ABM has shown unique advantages in the study of complex systems and can
effectively reflect the complexity and adaptability of the system
@zheng_primer_2013. Through simple local rules, ABM can generate complex system
behaviors, such as the collective behavior exhibited by the "Game of Life" and "Bird
Flock" models @macal_agent-based_2009. It can not only simulate multi-level
systems and capture complex interactions between individuals and between
individuals and the environment, but also allow agents to adjust decisions over
time @badham_developing_2018. ABM can also simulate the characteristics of
complex adaptive systems (CAS), including nonlinearity, fluidity and diversity,
as well as feedback mechanisms in the system @macal_tutorial_2005.

In social science research, ABM provides an innovative way to integrate theory
and computational methods. It applies social science decision theory (such as
the BDI model) to the decision rules of agents @zheng_primer_2013, and creates
the emerging field of computational social science by combining data mining and
complex system modeling. ABM can transform behavioral theories into computable
models and calibrate them using multi-source data. It integrates
multidisciplinary theoretical foundations such as complexity science, system
science, and management science. Through models such as SugarScape, ABM
successfully simulates complex social processes @macal_agent-based_2009. The
application of ABM in areas such as trust models demonstrates its ability to
integrate sociological concepts with computational models. This
interdisciplinary approach not only promotes the development of social science
theories, but also provides new perspectives and tools for the study of complex
social systems.

=== Tools and Platforms for ABM Development <label:platforms>

UML enhances Agent-Based Modeling by providing higher abstraction, improved
readability, and better modularity. It facilitates communication, documentation,
and design pattern application while being language-independent. UML captures
dynamic behaviors, promotes efficient modeling, and encourages professional
practices, ultimately improving ABM quality and maintainability
@bersini_uml_2011.

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
process, it is more appropriate to use the MESA package.

== Network Structure, Diffusion and Influencers <label:networkDiffusionLiter>

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

=== Influencers and Opinion Leaders in Diffusion

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

== Apply ABM methods into the Bass model <label:applyABM>

=== Existing research

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

=== Research Gap

Although there have been some cases of using ABM to study innovation diffusion,
these studies still have limitations in simulating social network structure and
individual heterogeneity. Many existing studies use fully connected networks or
relatively simplified network models to describe the relationships between
agents. For example, some studies use Moore's neighborhood network (that is,
each node is connected to 8 surrounding nodes in a two-dimensional space and
establishes connections with other random nodes) to simulate the innovation
diffusion process @holanda_modelling_nodate. Although this simplification is
computationally more convenient, it may not fully reflect the complexity of real
social networks.

In addition, descriptions of node heterogeneity are often too simplistic, mainly
dividing individuals into two categories: innovators and imitators. This binary
classification ignores the key role of influencers in social networks.
Influencers usually have extensive social connections and play an important role
in information dissemination and innovation diffusion. In the real world, these
highly connected individuals have a significant impact on the innovation
diffusion process, but have not received sufficient attention in existing ABM
research.

This simplified treatment of network structure complexity and individual
heterogeneity may result in the model being unable to accurately capture
innovation diffusion dynamics in actual markets. Therefore, it is necessary to
develop more sophisticated and realistic ABM models to better understand and
predict the innovation diffusion process.

== Conclusion of Literature Review <label:conclusionLiter>

By collating the literature review, the following ideas inspired our research
report:
- ABM is a powerful tool for simulating complex systems and social phenomena,
  providing a bottom-up approach to understanding emergent behaviors.
- The Bass diffusion model is widely used in innovation diffusion research, and
  ABMs offer advantages for modeling innovation diffusion compared to traditional
  aggregate approaches.
- Influencers and opinion leaders play a key role in information dissemination,
  and network structure and node heterogeneity significantly impact diffusion
  processes. Influencers mean they have more connections in the social network.
- Network topological structure, node heterogeneity, and opinion leaders are
  important factors in information diffusion, and ABMs can capture these dynamics
  effectively.
- The main limitation of ABM is that its modeling process requires strong
  theoretical support and model verification is often challenging. In contrast,
  although the Bass diffusion model can effectively describe macro market changes,
  it is difficult to capture the heterogeneity and micro dynamics of individual
  behavior.

== Statement of research objectives <label:questions>

This study aims to build an innovative market diffusion simulation framework
that integrates the theoretical foundation of the Bass diffusion model and the
micro-simulation capabilities of Agent-Based Modeling (ABM). This integrated
approach allows us to simulate the behaviors and interactions of individual
consumers more finely while considering both external and internal influences.
Our model specifically introduces the key attribute of "influencer" to improve
the representation of agent heterogeneity and more closely resemble the role
distribution in real social networks. In addition, this study embeds agents in
different types of network structures, aiming to deeply explore the impact of
social network topology on the innovation diffusion process. Through this
multi-dimensional modeling approach, we expect to be able to more
comprehensively understand and predict the innovation diffusion dynamics in
complex market environments.

And the following are our research proposals:

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
// + Evaluating the impact of market size on product diffusion dynamics: Studying how
//   different sizes of potential user groups affect the final diffusion rate and
//   saturation level of a product.
+ Investigation of the interactive effects of multiple factors on product
  diffusion: Explore the combined impact on the product diffusion process when
  multiple key parameters - such as innovation coefficient, imitation coefficient,
  proportion of innovators, or proportion of influencers - vary simultaneously.
  Analyze potential synergistic or counteracting effects among these factors and
  how they collectively shape diffusion dynamics.
+ Analysis of the impact of social network structure on product diffusion
  dynamics: Study how different types of social network structures (such as
  small-world networks, random networks, etc.) affect the spread and adoption
  speed of product information, as well as the relationship between these network
  characteristics and key indicators of the diffusion process (such as diffusion
  rate, peak time, saturation level, etc.).

= Methodology <label:Methodology>

In this section, we will introduce the model framework (@label:framework), agent
attributes (@label:agent_attr), social network structure (@label:network), and
diffusion mechanism of the ABM model for market diffusion research
(@label:diffusion). The model is designed to simulate the diffusion process of
new products in the market, taking into account the influence of individual
characteristics, social network structure, and market composition on the
diffusion dynamics. After that, we designed simulation experiments for the
research questions (@label:simPlanDesign) and ran ABM using the Mesa framework
(@label:run).

== Model framework introduction <label:framework>

=== Model Assumption

To address the research questions raised in @label:questions, we built a model
framework for ABM market diffusion research. It is based on the following key
assumptions:

#figure(
  image("img/abm_model/fourGroup.png", width: 80%),
  caption: "Market Composition of the ABM Model",
) <label:fourGroup>

- Agent heterogeneity: Agents are divided into two main types: innovators and
  imitators, which are further divided into influential and non-influential
  individuals (@label:fourGroup). Each agent has unique attributes, including
  consumer type and whether it is influenced. The transition from "non-adopted" to "adopted"
  for the adoption status of a new product is irreversible.
- Social network structure: Product information is spread through network
  connections, and the relationship between agents is constructed through
  small-world networks and random networks. On this basis, influential agents will
  add more connections to simulate the role of opinion leaders or key nodes in the
  diffusion process.
- Diffusion mechanism: The adoption of new products is affected by two main
  factors: external influence (innovation effect) and internal influence
  (imitation effect). Innovators adopt products independently, while imitators are
  influenced by the adoption behavior of other consumers in the social network.
  The adoption probability of each agent is determined by the parameters of the
  innovator and imitator.
- Market composition: Assuming a closed market, a fixed number of potential
  adopters (N), the total potential market size remains constant during the
  diffusion process, and the market consists of four types of agents: influential
  innovators, influential imitators, non-influential innovators, and
  non-influential imitators.

The market diffusion research model established based on these assumptions
becomes a powerful platform for simulating and analyzing complex product
diffusion processes by integrating agent heterogeneity, social network dynamics
and market structure.

=== Model structure

Modeling plays a crucial role in scientific research, with diverse purposes
including prediction, explanation, and description. Edmonds emphasize the
importance of clarifying model purposes, as this influences modeling and
validation strategies @edmonds_different_2019. In terms of modeling strategies,
KISS (Keep It Simple, Stupid) and KIDS (Keep It Descriptive, Stupid) represent
two distinct approaches @edmonds_kiss_2005. KISS aims to simplify models by
focusing on essential elements and relationships, so in our model we choose KISS
principle. We will focus on the core factors that affect the diffusion process,
such as agent types, social network structure, and diffusion mechanisms.

Regarding the many ABM modeling frameworks mentioned in @label:platforms,
considering that our model requires some support for complex networks and
statistics on the agent status at each moment, We finally chose to develope with
MESA #footnote[Mesa allows users to quickly create agent-based models using built-in core
  components (such as spatial grids and agent schedulers) or customized
  implementations; visualize them using a browser-based interface; and analyze
  their results using Python's data analysis tools. Website:
  https://mesa.readthedocs.io/en/stable/], using object-oriented programming,
and consists of two main classes: BassModel and BassAgent. The BassModel class
defines the overall model structure, including the network environment, agent
creation, and data collection. The BassAgent class defines the properties and
behaviors of individual agents.

The following UML shows the overview class diagram of the ABM model
(@label:class):

#figure(
  image("img/abm_model/class.png", width: 50%),
  caption: "Class Diagram of the ABM Model",
) <label:class>

We used a up approach to design the customer (agent) and the market environment
(BassModel). Bottom-up ABM starts from the micro-level, defining agents'
attributes, behavioral rules, and interactions to simulate complex system
dynamics @rixon_bottom-up_2005. This approach allows macro-level phenomena to
emerge naturally from micro-level interactions, capturing the heterogeneity and
adaptivity of the system @nageli_towards_2020. By constructing models from the
individual level, ABM provides a unique perspective for understanding and
explaining complex systems, demonstrating the advantages of bottom-up modeling
approaches. The characteristics (such as the type of the consumers, the
probability of accepting the product, etc.) of the user will be introduced in
detail in @label:agent_attr, and the simulation of the market environment (like
the social network type, the market scale and the proportion of different kinds
of consumer, etc.) will be presented in @label:network.

== Agent Attributes <label:agent_attr>
 
=== Parameters for Agent Level

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

=== Diffusion mechanism <label:diffusion>

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

== Social Network Structure <label:network>

The network structure in our ABM model is based on small-world networks and
random networks. On top of these two basic network structures, We further
introduced the key attribute of influencers. Influencers have more connections
in the network. This design is intended to simulate the role of opinion leaders
or key nodes in real society. There are three steps to build such a network:

Initialize a base network (@label:basenet and @label:netedgeequal) $arrow.r$ Put
agents on the network $arrow.r$ Add connections for influencers
(@label:addneigh)

As shown in the @label:netinit below:

#figure(
  image("img/abm_model/network_init.png", width: 100%),
  caption: "Initialization of the ABM Model Network",
) <label:netinit>

=== Base Network Structure <label:basenet>

This model simulates the interconnection and influence between consumers through
different social network structures. The network structure has an important
impact on the information dissemination and product adoption process. The model
supports 2 typical network types (small world and random network). The use the
Python NetworkX library #footnote[NetworkX is a package for complex networks. Official website:
  https://networkx.org/] to create the initial network structure.

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

The figure shows the network structure of a small-world network with 100 nodes
(agents), we can see that the random network has a higher clustering coefficient
and a shorter average path length compared to the small world network: 

#figure(
  image("img/abm_model/network.png", width: 100%),
  // caption: "Random and Small-World Network Structures",
  caption: [
    Random and Small-World Network Structures
    #link(
      "https://github.com/QianZeHao123/MDS-Research-Project/blob/main/ABM%20version%200.1/network.ipynb",
    )[
      [Code]
    ]
  ],
)

=== Network Edge Equalization <label:netedgeequal>

We hope to compare market diffusion in Erdős-Rényi random graphs and
Watts-Strogatz small-world networks. To ensure comparability, We use a
controlled variable approach, maintaining identical node counts (N) and total
edge numbers across both network types.

We achieve two different networks in which each node has the same number of
connections with other nodes by adjusting the connection probability p in the
random network model and the initial neighbor count k in the small world model
to achieve the same number of edges:

- For Erdős-Rényi graphs, the expected number of edges is: 
$ E("edges") = 1/2 times p times N (N-1) $
- For Watts-Strogatz graphs, the number of edges is fixed at:
$ "edges" = 1 / 2 times N times k $

By setting these two values equal, we can derive:
$ p = k / (N-1) $

For example, in our simulation, we set $N=1000$, $k=4$ in the small world
network, so we can calculate $p approx 0.004004$ for random network.

This approach constructs network models with identical node counts and edge
numbers but differing topological structures, providing an ideal platform for
studying the impact of network structure on information diffusion. This way,
each agent can have a similar number of neighbors before adding more links to
the Influencial agent. This can be demonstrated in @label:neighbor_stat.

=== Add More Edges for Influencers <label:addneigh>

In social network structure research, influencers are usually defined as nodes
with more connections. Here we add additional connections to influencers. This
can simulate the influencer's extensive influence in the social network.

Here is the logic to implement adding more neighbors to an influencer (G means
the network graph, achieved by @label:netedgeequal):

#figure(
  table(
    columns: 1,
    align: left,
  )[*Algorithm 1: Rules for adding more neighbors to Influencer*][
    #algorithm(
      {
        import algorithmic: *
        Function(
          "Enhance-Influencers-Connections",
          args: ("G", "agents"),
          {
            For(
              cond: [each agent in agents],
              {
                If(
                  cond: [agent is influencer],
                  {
                    State[Get current neighbors of agent]
                    State[Identify potential new neighbors (nodes not currently connected and not self)]
                    State[Additional Edges = min(int(25*random.random())+30, len(potential_neighbors)))]
                    State[Calculate number of additional edges (random between 30 to 54 $arrow.t$)]
                    State[Randomly select new neighbors from potential neighbors]
                    For(cond: [each new neighbor], {
                      If(cond: [edge doesn't exist between agent and new neighbor], {
                        State[Add edge between agent and new neighbor]
                      })
                    })
                  },
                )
              },
            )
          },
        )
      },
    )
  ],
  caption: [Algorithm for Enhancing Influencers' Connections],
)

== Model Input and Simulation Design

=== Model Parameters

This Model contains several key parameters that together define the behavior and
characteristics of the model. The following is a detailed description of these
parameters:

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
    [Options: "random", "small_world"],
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
    table.hline(),
    [*Influence Parameter*],
    [],
    [],
    [Extra connections],
    [Additional connections for influential agents],
    [Simulates the broad influence of opinion leaders],
    table.hline(),
  ),
)

=== Design of the Simulation Experiment <label:simPlanDesign>

Experimental design is a core component of methodology, which directly
determines how to test research hypotheses and answer research questions. Our
experimental design systematically covers changes in multiple key parameters
(such as innovation coefficient p, imitation coefficient q, network type,
influencer ratio, etc.) and considers their interactions to ensure the
comprehensiveness and rigor of the research. Each set of experiments is iterated
5 or 25 times, and such a design captures the randomness of the model and the
stability of the results. Through this systematic and comprehensive experimental
design, the foundation for the analysis and discussion of the results is laid.

We designed a series of simulation experiments to explore the impact of
different parameters on the product diffusion process. These experiments are
divided into two categories, each containing 6 sets of experiments, conducted in
small-world networks and random networks respectively. All experiments are based
on a network of 1,000 agents with multiple iterations to eliminate the
randomness of the simulation. Each set of experiments uses the same parameter
settings in both network structures in order to directly compare the impact of
the network structure. The following is a detailed description of the
experimental design:

- Network Type: Small-world network experiments (simulations 1-6) and random
  network experiments (simulations 7-12)
- Effect of the innovation coefficient (p) on diffusion:
  - Simulations 1 and 7: Adjust the p coefficient (0.01 to 0.03), keeping other
    parameters unchanged.
  - Purpose: To understand how the innovator adoption probability affects the
    diffusion speed and pattern in different network structures.
- Effect of imitation coefficient (q) on diffusion:
  - Simulations 2 and 8: Adjust the q coefficient (0.3 to 0.5) and keep other
    parameters unchanged.
  - Purpose: To explore the effect of imitator adoption probability on the diffusion
    process in different network structures.
- Effect of influencer ratio on innovator diffusion:
  - Simulations 3, 4 and 9, 10: Adjust the ratio of influencers to innovators (0 to
    0.01), keeping the total innovator ratio constant.
  - Purpose: To study how the proportion of influencers in the innovator group
    affects the diffusion dynamics of different network structures.
- Effect of the ratio of influencers to innovators on diffusion:
  - Simulations 3 and 9: Adjust the ratio of influential innovators (0 to 0.01),
    keeping the ratio of total innovators constant (0.01).
  - Simulations 4 and 10: Adjust the ratio of influential innovators (0 to 0.01),
    keeping the ratio of total influencers constant.
  - Purpose: To study how the ratio of influencers in the group of innovators
    affects the diffusion dynamics of different network structures. In particular,
    we want to study what happens when the number of influential innovators is zero.
- Interaction between innovation coefficient and proportion of innovators:
  - Simulations 5 and 11: Adjust p coefficient (0.01 to 0.05) and proportion of
    innovators (0.01 to 0.07) simultaneously.
  - Purpose: To explore how the interaction between innovation coefficient and
    proportion of innovators affects the diffusion process in different network
    structures.
- Interaction of innovator and influencer proportions:
  - Simulations 6 and 12: Simultaneously adjust the innovator proportion (0.01 to
    0.07) and the influencer proportion (0 to 0.6).
  - Purpose: To investigate how the distribution of innovators and influencers in
    different network structures jointly influences diffusion dynamics.

// The @label:simPlan below shows all the detailed parameters that need to be input for each simulation.

// #simInfo

== Run the ABM Model <label:run>

=== Initialize the Model

The following pseudocode outlines the core initialization process for our
Agent-Based Model (ABM) of product diffusion. This initialization sets up the
fundamental structures and parameters necessary for simulating the Bass
diffusion model in a network context. The code demonstrates how we establish the
agent population, create the social network, and prepare the model for
simulation runs.

#figure(
  table(
    columns: 1,
    align: left,
  )[*Algorithm 2: Final Initialization for Market Diffusion Simulation Model*][
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
  ],
  caption: [Summary of the Model Initialization Process],
)

=== Scheduler and Barch Running with MESA

Schedulers play a key role in Agent-Based Models. We chose to use the
RandomActivation scheduler provided by Mesa. The main reason for using a
scheduler is to manage and control the order in which agents in the model are
activated. At each simulation step, the RandomActivation scheduler randomly
decides the order in which to activate agents. This randomness is important
because it helps avoid systematic biases that may be introduced by a fixed
activation order. The @label:scheduler shows the difference between the five
agents at each time step when using random activation and when not using random
activation. In the real-world product diffusion process, the order in which
consumers make decisions is often not fixed, and using random activations can
better simulate this uncertainty. In addition, the scheduler simplifies the time
management of the model, allowing us to easily iterate over all agents at each
time step, update their states, and collect relevant data. By creating a
scheduler instance at model initialization and calling `self.schedule.step()` to
activate all agents at each time step, we ensure that the model runs
consistently and controllably. This approach is particularly suitable for
simulating social processes that do not have a fixed order, such as our product
diffusion model, allowing us to more accurately capture complex market dynamics.

#figure(
  caption: "Comparison of Agent Activation Order with and without Random Activation Scheduler",
  table(
    columns: (auto, auto, auto),
    align: (center, center, center),
    stroke: none,
    table.hline(),
    table.header(
      [*Time Step*],
      [*Without Random Activation*],
      [*With Random Activation*],
    ),
    table.hline(),
    [0],
    [1 $arrow$ 2 $arrow$ 3 $arrow$ 4 $arrow$ 5],
    [1 $arrow$ 2 $arrow$ 3 $arrow$ 4 $arrow$ 5],
    [1],
    [1 $arrow$ 2 $arrow$ 3 $arrow$ 4 $arrow$ 5],
    [3 $arrow$ 1 $arrow$ 5 $arrow$ 2 $arrow$ 4],
    [2],
    [1 $arrow$ 2 $arrow$ 3 $arrow$ 4 $arrow$ 5],
    [5 $arrow$ 4 $arrow$ 2 $arrow$ 1 $arrow$ 3],
    [$dots$],
    [1 $arrow$ 2 $arrow$ 3 $arrow$ 4 $arrow$ 5],
    [2 $arrow$ 3 $arrow$ 1 $arrow$ 5 $arrow$ 4],
    [n],
    [1 $arrow$ 2 $arrow$ 3 $arrow$ 4 $arrow$ 5],
    [4 $arrow$ 1 $arrow$ 3 $arrow$ 5 $arrow$ 2],
    table.hline(),
  ),
) <label:scheduler>

Batch execution is an effective way to execute different parameter combinations
in a single simulation script. With Mesa's BatchRunner, we can systematically
study the impact of different parameter combinations on product diffusion. The
method allows us to define parameter ranges (such as innovation coefficients and
imitation coefficients), perform multiple repeated simulations, and
automatically collect data. With batch execution, we can perform sensitivity
analysis to understand how different market conditions affect product adoption,
identify key parameters and critical points, and predict diffusion trends under
different scenarios. At the same time, repeating experiments for the same
parameter combination takes a lot of time. CPU multiprocessors can solve this
problem when implementing batch execution capabilities to speed up the
simulation process.

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

= Simulation and Results Analysis <label:SimulationResults>

In this section, we will present the simulation results of our market diffusion
ABM in detail and conduct an in-depth analysis of these results. First, we will
present detailed statistics of a single simulation (@label:single_stat_sim),
including adoption curves and network evolution visualizations, to intuitively
demonstrate the diffusion process. Next, we will explore in depth the impact of
different parameters on the diffusion process with sensitivity analysis,
including the role of innovation coefficients (@label:p_change_research) and
imitation coefficients (@label:q_change_research), the importance of the
proportion of influencers (@label:inno_prop_research_sec), the impact of network
structure, etc. We will also analyze multi-factor interactions to reveal how
parameter combinations jointly shape the diffusion dynamics
(@label:p_prop_inno_research_sec, @label:prop_inno_inf_research_sec_full).

== Table of Neighbors between Influencers and Non-Influencers <label:neighbor_stat>

Before doing any ABM analysis, we first need to verify the similarity of the
number of connections between different networks mentioned and add more
neighbors to the influencers in @label:network. Statistically analyze whether
the influencers and non-influencers are the same in different networks. This is
the premise for the following series of comparisons.

The tables below shows the average, maximum, and minimum values of the number of
influencer and non-influencer neighbors in the first five simulations. The
number of neighbors of an influencer is approximately 4 to 6 times that of a
flying influencer (@infstatable).

#figure(
  caption: [Run Data for Agent-Based Model #link(
      "https://github.com/QianZeHao123/MDS-Research-Project/blob/main/ABM%20result%20visualization/model%20version%206%20visualization/2_agent_neighbour_stat.Rmd",
    )[[Code]]],
  table(
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
  ),
) <infstatable>

The @label:neighbor_stat_vis is a statistical analysis of the number of
neighbors of all agents in simulation 1 (visualizations of simulations 2-16 are
similar). The gray-green points in the figure represent influencers and he brown
points represent non-influencers. From @label:neighbor_stat_vis, we can see that
the number of non-influencer neighbors in the small-world network (8.205) and
the random network (8.208), as well as the mean number of influencer neighbors
(50.044 in random network and 50.077 in small world network), are basically the
same. We can also see that the number of influencer neighbors is much higher
than that of non-influencers.

#figure(
  caption: [Neighbor statistics for Influencers and Non-Influencers #link(
      "https://github.com/QianZeHao123/MDS-Research-Project/blob/main/ABM%20result%20visualization/model%20version%207%20visualization/0_neighbor_cal_random_sm.Rmd",
    )[[Code]]],
  image("img/pic_neighbour_stat_network/neighbor_stat.png", width: 100%),
) <label:neighbor_stat_vis>

In summary, the statistics in this section verify that the number of neighbors
of influencers is much higher than that of non-influencers. It also proves that
the network equilibrium achieved in @label:netedgeequal makes the two networks
comparable.

== Single Run Simulation Results Statistics <label:single_stat_sim>

=== Statistics of Consumer's Adoption for single simulation

This @label:single_stat shows one of the market diffusion simulations, showing a
classic S-shaped adoption curve. The simulation set 1% innovators and 10%
influencers, with an innovation coefficient p of 0.01 and an imitation
coefficient q of 0.3. The results show that a small number of innovators took
the lead in adopting the product in the early stage (0-25 steps), followed by
rapid diffusion between 25-50 steps, which may be due to the network effect
driven by influencers. Influential agents showed higher adoption rates, but
overall imitators constituted the vast majority of adopters. The whole process
reached market saturation after about 50 steps, and the final adoption rate was
close to 100%.

#figure(
  caption: [Adoption Statistics for a Single Simulation Run #link(
      "https://github.com/QianZeHao123/MDS-Research-Project/blob/main/ABM%20result%20visualization/model%20version%207%20visualization/9_single_sim_stat.Rmd",
    )[[Code]]],
  image("img/pic_single_stat/combined_plot.png", width: 100%),
) <label:single_stat>

It is worth noting that this simulation result (simulating the decision of every
potential consumer in the market at the micro level) is highly consistent with
the pattern predicted by the traditional Bass diffusion model (describing the
entire market at the macro level). This consistency can be regarded as a pattern
matching, which provides strong support for the effectiveness of the ABM model
test. Among them, due to the relatively small number of innovators, the
observation is not obvious, but in the statistics of the three groups of
influencers, non-influencers and imitators, an obvious S-shaped growth curve can
also be observed.

=== Visualization of Network Evolution

To gain a more intuitive understanding of the process of product adoption
spreading in social networks, we created a series of network graphs to visualize
the time evolution of agent activations. These networks (@label:network_graph)
were generated by the NetworkX library and visualized with igraph. In these
graphs, nodes represent individual agents and edges represent social connections
between them. Red nodes represent agents that have adopted the product, while
blue nodes represent agents that have not yet adopted. The size of the node
represents the influence of the agent, with larger nodes representing
influential individuals.

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
  caption: [Network Evolution over Time from Step 0 to Step 80 #link(
      "https://github.com/QianZeHao123/MDS-Research-Project/blob/main/ABM%20result%20visualization/model%20version%207%20visualization/1_network_visualization.Rmd",
    )[[Code]]],
  network_image_grid,
) <label:network_graph>

Market diffusion shows obvious characteristics of evolution over time. In the
initial stage (Step 0-20), the network is predominantly blue, and only a few
nodes (most likely innovators) begin to adopt the product. As time goes by to
Step 30-40, we observe a significant increase in the number of red nodes,
especially in the core area of the network, indicating that the product begins
to spread widely among influential agents. Entering Step 50-60, the red nodes
quickly spread throughout the network, marking the rapid growth stage of product
adoption. Finally, at Step 70-80, the network is almost completely covered by
red nodes, indicating that product adoption is close to saturation.

== Research on Different Probability of Adoption <label:diff_prob_research>

=== Research on Innovation Coefficient (p) <label:p_change_research>

The innovation coefficient represents the tendency of consumers to independently
adopt new products. In simulation 1 and 7, we used the control variable method
to change only the value of the innovation coefficient p (ranging from 0.01 to
0.03), while keeping all other parameters unchanged, including the imitation
coefficient (q), network structure (q=0.3, proportion of innovators=0.01,
proportion of influencers=0.1, N=1000), overall market size, etc. For each p
coefficient, multiple simulations were performed to ensure the stability and
reliability of the results.

#figure(
  caption: [Boxplot of Different Innovator Adoption Probabilities in Small World Network #link(
      "https://github.com/QianZeHao123/MDS-Research-Project/blob/main/ABM%20result%20visualization/model%20version%207%20visualization/3_p_change_research.Rmd",
    )[[Code]]],
  image("img/pic_p_change_research/box_sm.png", width: 80%),
) <label:p_boxplot_sm>

This box plot (@label:p_boxplot_sm) is made by adjusting the p coefficient from
0.01 to 0.03 while keeping other parameters unchanged in small world network. In
general, as the p coefficient increases, the time required to reach 25%, 50%,
and 75% adoption rates is significantly shortened, like in the early stages. For
example, the median number of steps to reach a 25% adoption rate dropped from
about 30 to 25. This effect weakened but still existed in the later stages (75%
adoption rate). At the same time, the increase in p coefficient also led to a
decrease in the variability of the results, indicating that the adoption process
under high innovation coefficients is more stable and predictable. These
findings emphasize the importance of increasing the innovation coefficient (such
as through effective marketing) to accelerate product adoption, especially in
the early stages of market penetration.

#figure(
  caption: [Boxplot of Different Innovator Adoption Probabilities in Random Network #link(
      "https://github.com/QianZeHao123/MDS-Research-Project/blob/main/ABM%20result%20visualization/model%20version%207%20visualization/3_p_change_research.Rmd",
    )[[Code]]],
  image("img/pic_p_change_research/box_random.png", width: 80%),
) <label:p_boxplot_random>

When comparing the product adoption process in random networks and small-world
networks, we can observe an interesting phenomenon: when the innovation
coefficient (p) is small, the adoption process in the random network
(@label:p_boxplot_random) exhibits greater variability, especially when p =
0.01, the whiskers and outliers of its box plot are wider.

#let combined_plot = (
  "img/pic_p_change_research/combined_plot_sm.png",
  "img/pic_p_change_research/combined_plot_random.png",
)

#let combined_plot_grid = grid(
  columns: 2,
  gutter: 10pt,
  ..combined_plot.map(img => image(img, width: 100%)),
)

#figure(
  caption: [A comparison about Line Plot of Different Innovator Adoption Probabilities #link(
      "https://github.com/QianZeHao123/MDS-Research-Project/blob/main/ABM%20result%20visualization/model%20version%207%20visualization/3_p_change_research.Rmd",
    )[[Code]]],
  combined_plot_grid,
) <label:p_lineplot>

The left side of the @label:p_lineplot shows what different p look like in a
small-world network, and the right side shows what it looks like in a random
network. Each data point represents a specific simulation result, the blue
shaded area indicates the distribution range of the simulation results, and the
red line represents the average number of steps at each p coefficient. 


#figure(
  image("img/pic_p_change_research/box_final.png", width: 80%),
  caption: [Comparison of different p coefficient in two networks when 50% reaches #link(
      "https://github.com/QianZeHao123/MDS-Research-Project/blob/main/ABM%20result%20visualization/model%20version%207%20visualization/3_p_change_research.Rmd",
    )[[Code]]],
) <label:p_boxplot_final>

It can be seen that when p coefficient is relatively large
(@label:p_boxplot_final), the results of the two networks are more similar.
However, when P is relatively small, the coverage interval after random network
simulation is larger. 

We think this result may be caused by the fact that small-world networks have
the characteristics of high clustering coefficient and short average path
length, which may lead to rapid local propagation of information and rapid reach
to other parts of the network. In contrast, the connections of random networks
are more evenly distributed, but lack strong local clustering. At the same time,
when the p coefficient is small, product adoption mainly depends on social
propagation in the network (imitation effect) rather than independent adoption
by individuals. In this case, the characteristics of the network structure
become more important.

=== Research on Imitation Coefficient (q) <label:q_change_research>

Similar to the method of studying the innovation coefficient, in the study of
the imitation coefficient q (simulation 2 and 8), other parameters are fixed
(p=0.02, proportion of innovators=0.01, proportion of influencers=0.1, N=1000),
only the value of q is changed (0.3 to 0.5), and the simulation is repeated many
times. This study selects p=0.02 as the baseline innovation coefficient instead
of 0.01, which is based on the observation in previous experiments that the two
network types showed huge differences at p=0.01 (in @label:p_change_research
when p=0.01 in random network, the box plot shows the results varied more than
the small world network). This choice aims to reduce the interference of
differences in network structure on the analysis of the impact of imitation
coefficients, thereby obtaining a purer q coefficient effect. The following
(@label:q_boxplot_sm) are the simulation results when 25%, 50%, and 75% of the
users are accepted in two different networks:

#figure(
  caption: [The impact of imitation coefficient on product adoption rate in different
    network structures],
  image("img/pic_q_change_research/box_combine.png", width: 100%),
) <label:q_boxplot_sm>

The results show that as the imitation coefficient q increases from 0.3 to 0.5,
the speed of product diffusion generally shows an accelerated trend. Especially
in random networks, the variability of results is significantly reduced,
indicating that the propagation process under high imitation coefficients
becomes more stable and predictable in random networks. However, small-world
networks do not show the same clear trend of decreasing variability. Although
small-world networks still exhibit slightly faster propagation speeds at lower q
values, the performance gap between the two network types gradually narrows as q
values increase. 

It is worth noting that compared with the growth effect of the innovation
coefficient p (from 0.01 to 0.02), the growth of the imitation coefficient q has
a relatively limited impact on accelerating network diffusion. This finding
highlights that in the product adoption process, increasing the imitation
coefficient may not be as effective as increasing the innovation coefficient,
especially when pursuing significantly accelerated diffusion.

== Research on the proportion of Influential Innovators <label:inno_prop_research_sec>

This section will focus on the impact of the proportion of influential
innovators on the product diffusion process (@label:inno_prop_research_zero),
especially when the proportion of Influencial Innovators = 0. We will study this
issue through two different experimental settings: First, we will study how the
change in the proportion of influential innovators affects the product diffusion
process when the total influencer proportion is fixed (simulation 3 and 9).
Second, we will study how the change in the proportion of influential innovators
affects the product diffusion process when the innovator proportion is fixed
(simulation 4 and 10).

#figure(
  image("img/abm_model/fourzero.png", width: 80%),
  caption: [Research on the proportion of influential innovators],
) <label:inno_prop_research_zero>

=== Fixed proportion of Innovators

The @label:inno_boxplot analyzes the impact of changes in the proportion of
influential innovators on the product diffusion process when the total
proportion of innovators is fixed at 1% (p=0.01, q=0.03, N=1000):

#figure(
  caption: [The influencer proportion is fixed],
  image("img/pic_same_inno_prop_research/box_combine.png", width: 100%),
) <label:inno_boxplot>

From the figure, we can analyze that when the total proportion of innovators is
fixed, increasing the proportion of influential innovators can only slightly
accelerate the product diffusion process. Random networks and small-world
networks show similar characteristics at different stages, and the overall
propagation speed of random networks is slightly faster than that of small-world
networks. This shows that increasing the proportion of influential innovators
has limited effect on accelerating product diffusion, especially when the total
proportion of innovators is low. At the same time, similar to the simulation
results of the lower innovation coefficient p, a low proportion of innovators
will cause greater variability in results.

=== Fixed proportion of Influencers

The @label:inf_boxplot shows the effect of changing the proportion of
influential innovators on the product diffusion process, while fixing the total
proportion of influencers at 10% (p=0.01, q=0.03, N=1000):

#figure(
  caption: [The innovator proportion is fixed],
  image("img/pic_same_inf_prop_research/box_combine.png", width: 100%),
) <label:inf_boxplot>

It can be clearly seen from this figure that compared with the scenario where
the proportion of total innovators remains constant, when the proportion of
total influencers is fixed, increasing the proportion of influential innovators
can significantly accelerate the product diffusion process. At the same time, as
the proportion of influential innovators increases (from 0 to 0.003), the
variability of the results significantly decreases.

Compared with the previous figure (@label:inno_boxplot), it can be concluded
that the diffusion rate of random networks is slightly higher than that of
small-world networks. With the proportion of total influencers fixed, increasing
the proportion of influential innovators has a more significant positive impact
on product diffusion speed, while significantly reducing the variability of
results, making the diffusion process more predictable. In this case,
continuously increasing the proportion of influential innovators seems to
continuously improve the diffusion effect. In contrast, when the total
proportion of innovators is fixed, increasing the proportion of influential
innovators has a small impact on the diffusion speed, the reduction in the
variability of the results is not obvious, and the improvement effect is more
limited. This suggests that overall market structure (especially the overall
proportion of influencers) has an important impact on product diffusion dynamics
when considering the role of influential innovators.

== Change on the Innovation Coefficient and Innovator proportion <label:p_prop_inno_research_sec>

// pic_p_prop_inno_research
#let p_prop_inno_images = (
  "img/pic_p_prop_inno_research/step_to_25_sm.png",
  "img/pic_p_prop_inno_research/step_to_50_sm.png",
  "img/pic_p_prop_inno_research/step_to_75_sm.png",
  "img/pic_p_prop_inno_research/step_to_25_random.png",
  "img/pic_p_prop_inno_research/step_to_50_random.png",
  "img/pic_p_prop_inno_research/step_to_75_random.png",
)

#let p_prop_inno_image_grid = grid(
  columns: 3,
  gutter: 10pt,
  ..p_prop_inno_images.map(img => image(img, width: 100%)),
)

In market diffusion research, we often need to consider the impact of multiple
factors on the product adoption process at the same time. In order to
intuitively show how the two key variables, the innovation coefficient (p) and
the proportion of innovators, jointly affect the product diffusion rate, I
designed this set of heat maps (@label:p_prop_inno_research). Heat maps can
effectively show the interaction between two variables and their impact on the
outcome variable. In this study, each cell in the heat map represents the
average number of time steps required for the product to reach a specific
adoption rate (25%, 50% and 75%) under a specific combination of innovation
coefficient and innovator proportion. Each value shown in the figure is the
average result of five independent simulations with the same parameter settings.

#figure(
  caption: [Research on Innovators of Small World Network (up) and Random Network (down)],
  p_prop_inno_image_grid,
) <label:p_prop_inno_research>

These heat maps (@label:p_prop_inno_research) illustrate how the probability of
product acceptance by an innovator and the proportion of innovators jointly
affect the rate of product diffusion. The overall trend shows that as these two
factors increase, diffusion speeds up (the heat map becomes darker and the
values ​​decrease). However, this relationship is nonlinear, the changes are
more significant in low-value areas, and there are obvious interactive effects.

The two network structures (small-world and random networks) exhibit similar
overall patterns but differ in details, especially in regions of low innovation
parameters. It is worth noting that a saturation effect appears in the
high-value area, indicating that there is an optimal point beyond which the
marginal benefits of continuing to increase innovation input are diminishing.

These findings have important implications for formulating market strategies:
when resources are limited, a trade-off needs to be made between increasing the
probability of innovator acceptance and increasing the proportion of innovators;
in the early stage, more emphasis may be placed on increasing the probability of
acceptance; different network structures may require different Optimization
strategy.

== Change on Proportion of Influencers and Innovators <label:prop_inno_inf_research_sec_full>

In order to gain a deeper understanding of the interaction between these two key
factors, a heat map is also used here, as in @label:p_prop_inno_research_sec.
The @label:prop_inno_inf_research shows how the proportion of innovators and the
proportion of influencers jointly affect the speed of product diffusion under a
fixed innovation coefficient (p=0.01) and imitation coefficient (q=0.3). Each
cell in these heat maps represents the average number of time steps required for
a product to reach a specific adoption rate under a specific combination of
parameters.

// pic_prop_inno_inf_research
#let prop_inno_inf_images = (
  "img/pic_prop_inno_inf_research/step_to_25_sm.png",
  "img/pic_prop_inno_inf_research/step_to_50_sm.png",
  "img/pic_prop_inno_inf_research/step_to_75_sm.png",
  "img/pic_prop_inno_inf_research/step_to_25_random.png",
  "img/pic_prop_inno_inf_research/step_to_50_random.png",
  "img/pic_prop_inno_inf_research/step_to_75_random.png",
)

#let prop_inno_inf_image_grid = grid(
  columns: 3,
  gutter: 10pt,
  ..prop_inno_inf_images.map(img => image(img, width: 100%)),
)

#figure(
  caption: [Steps to Reach 25%, 50%, and 75% Adoption Rates with Different Innovator's
    Proportion and Influencer's Proportion (small world network $arrow.t$, random
    network $arrow.b$)],
  prop_inno_inf_image_grid,
) <label:prop_inno_inf_research>

It can be analyzed from the figure that as the proportion of innovators
increases from 0.01 to 0.07, and the proportion of influencers increases from 0
to 0.6, we observe an overall acceleration of the diffusion speed, but this
effect is not linear. The impact of the innovator ratio is more significant at
low values, while the marginal benefit of the influencer ratio shows a
decreasing trend. The interactive effect between the two is most obvious in the
lower left corner (both ratios are low) and the upper right corner (both ratios
are high), which correspond to the slowest and fastest diffusion speeds
respectively.

Comparing the heat maps of small-world networks and random networks, we find
that although the overall trends are similar, random networks exhibit slower
diffusion speeds at low innovator and low influencer ratios, again indicating
that network structure has an important impact on innovation diffusion. In
addition, color "jumps" in the heat map suggest possible critical points beyond
which the marginal benefit of increased diffusion speed decreases.

= Discussion <label:Discussion>

== Summary of Findings

In today's rapidly changing market environment, understanding the diffusion
process of new products and innovative ideas is crucial for companies and
policymakers. By integrating the theoretical foundations of Bass diffusion model
and complex networks, as well as the micro-simulation capabilities of ABM, we
are able to capture the subtle dynamics and complex interactions that are
difficult to reveal in traditional aggregate models. We believe that through a
series of well-designed simulation experiments and comprehensive results
analysis, we have not only successfully answered key research questions, but
also revealed some thought-provoking new insights.

=== Model effectiveness

Our market diffusion model demonstrates high validity and reliability. It is
based on the widely recognized Bass diffusion model and social network theory,
and innovatively combines the ABM method to better capture individual behaviors
and interactions in complex systems. The model is comprehensively designed,
taking into account multiple key factors, including innovation coefficient,
imitation coefficient, network structure, and consumer type. The model
demonstrates its stability and explanatory power through the S-shaped adoption
curve of single simulation results (@label:single_stat), neighbor statistics
(@label:neighbor_stat_vis), detailed sensitivity analysis, network structure
comparison, and intuitive visual verification. The findings are highly
consistent with real-world observations and existing research, further
confirming the validity of the model. In addition, the scalability of the model
provides a good foundation for future research, allowing for the further
addition of more consumer characteristics or complex decision rules.

=== Response to Research Questions

Here we briefly review the research questions and come up the answers obtained
through simulation analysis.

+ The relationship between individual adoption probability and market diffusion
  rate: How do different innovation coefficients (p) and imitation coefficients
  (q) affect the overall market diffusion process? 
  #table(
    columns: (auto),
    align: (left),
    [Research on Different Probability of Adoption (@label:diff_prob_research)
      reveals how these parameters affect the overall market diffusion process by
      adjusting the innovation coefficient (p) and the imitation coefficient (q) in
      the Bass model (Simulation: 1, 2, 7 and 8).
      - First, regarding the impact of the innovation coefficient (p): high p
        coefficients not only accelerate initial adoption, but also reduce the
        uncertainty of the results. This may reflect the importance of strong innovation
        marketing strategies (such as advertising, product demonstrations, etc.) in
        promoting early adoption and building market momentum. However, the marginal
        benefits brought by the increase in p coefficient shows a decreasing trend,
        especially when reaching a higher adoption rate. This phenomenon suggests that
        overinvestment in improving innovation adoption may not always be the most
        effective strategy, especially in the later stages of the product life cycle.
      - Second, the impact pattern of the imitation coefficient q is different from that
        of p, reflecting the unique role of social influence and network effects in the
        diffusion process. The increase in q coefficient mainly accelerates the
        diffusion in the middle and late stages, which is consistent with the phenomenon
        that word-of-mouth effects and social network influence increase over time in
        reality. Another interesting finding is the moderating effect of network
        structure on the impact of q. In random networks, the increased stability
        brought by high q coefficient may reflect a more uniform flow of information. In
        contrast, the slightly faster diffusion speed exhibited by the small-world
        network at low q coefficient may stem from its characteristics of high
        clustering coefficient and short average path length, which are conducive to
        local rapid diffusion.
    ],
  )
+ Influence of innovators and opinion leaders: How does the ratio of innovators
  and influential individuals affect the market penetration and diffusion rate of
  products? 
  #table(
    columns: (auto),
    align: (left),
    [Innovators and opinion leaders play a key role in the product diffusion process,
      especially in today's age of social media. Our study further explores the impact
      of these key individuals on the speed of market penetration and diffusion by
      adjusting the proportion of influential innovators in the model (Simulation 3,
      4, 9 and 10). These findings revealed several key insights:
      - The importance of influential innovators: Our results strongly support the
        importance of identifying and engaging influential innovators. When these key
        individuals occupy a larger proportion of the innovator population, they can
        significantly accelerate the overall diffusion process. This may be because they
        not only have a propensity to adopt innovations but also to quickly spread
        innovation information through their extensive social networks.
      - The importance of overall market structure: Interestingly, increasing the
        proportion of influential innovators has different effects across different
        market structures. When the overall proportion of influencers is fixed,
        increasing the proportion of influential innovators has the most significant
        effect. This suggests that simply increasing the number of innovators may not be
        enough to accelerate diffusion; the key lies in whether these innovators have
        widespread influence.
      - Amplification of network effects: Influential innovators appear to be able to
        amplify network effects. While keeping the proportion of total influencers
        constant, increasing the proportion of influential innovators not only speeds up
        diffusion but also significantly reduces the variability of the results. This
        means that their presence makes the diffusion process more stable and
        predictable.
      - Effect of network structure: Although random networks show slightly faster
        diffusion speeds, the role patterns of influential innovators are similar under
        both network structures.],
  )
+ The role of consumer group heterogeneity: How does the proportion of different
  types of consumers (e.g., innovators, imitators, influential and non-influential
  individuals) affect product diffusion? #rect[By segmenting consumer types (innovators or not and influencers or not), the
    study analyzes how the proportions of these different groups jointly shape the
    market penetration and diffusion rate of a product. Our analysis revealed the
    following key findings:
    - Network structure plays an important regulatory role in the innovation diffusion
      process. In small-world networks, the role of influencers is more prominent,
      especially when the proportion of innovators is low. In contrast, random
      networks show greater sensitivity to the proportion of innovators. This suggests
      that different social network structures may influence the dynamic process of
      innovation diffusion.
    - While imitators make up the majority of consumers, their behavior is strongly
      influenced by innovators and influencers. Changes in the proportion of mainly
      affect the speed of diffusion in the middle and late stages. This highlights the
      interaction and role between different types of consumers in the innovation
      diffusion process.
  ]
+ Multi-factor interactions: How do the interactions of key parameters (e.g.,
  innovation coefficient, imitation coefficient, proportion of innovators,
  proportion of influencers) jointly affect diffusion dynamics? #rect[
    - The interaction between the proportion of innovators and influencers shows a
      complex "substitution-complementary" relationship. When the proportion of
      innovators is low (less than 2%), increasing the proportion of influencers can
      significantly accelerate the diffusion process. However, when the proportion of
      innovators is high (bigger than 5%), an increase in the proportion of
      influencers has a relatively small effect on diffusion speed. This illustrates a
      dynamic interplay between innovators and influencers in different contexts.
    - We observe that there is a certain "tipping point", when the ratio of innovators
      and influencers reaches a certain level at the same time, the rate of diffusion
      increases sharply. This critical point is roughly located in the area where the
      proportion of innovators is 3-4% and the proportion of influencers is 15-20%.
      Once this critical point is exceeded, the rate of diffusion of innovation will
      increase significantly.
  ]
+ The impact of social network structure: How do different network structures
  (such as small-world networks and random networks) affect the spread and
  adoption speed of product information? #rect[In our simulation experiments, we observed quite different results in different
    networks using the same parameter combination. The key findings are as follows:
    - Overall diffusion speed difference: In the case of small parameters, the
      diffusion speed of random networks is significantly faster than that of
      small-world networks; in the case of large parameters, the diffusion speeds of
      the two networks are almost the same.
    - Differences in simulation results: The results of random networks are more
      average, less variable, and will slowly aggregate as the parameters increase.
      The results of small-world networks will also be more concentrated, but the
      regularity is not strong.]

== Comparison with Existing Research

=== Similarities and differences with bass model

When using Agent-Based Modeling (ABM) to conduct simulation research on market
diffusion, the conclusions obtained were consistent with the parameter analysis
results of the traditional Bass model. That is, in the Bass innovation diffusion
model, the size and relative relationship of the p and q parameters have a
significant impact on the diffusion model. A larger p coefficient represents
strong innovation or external influence, leading to early and rapid diffusion; a
larger q coefficient represents strong imitation or internal influence, forming
a typical S-shaped curve @orbach_parametric_2016.

However, ABM simulations require significantly longer time steps than
traditional Bass models. Through @label:bassfull, we can calculate the time
steps required when the customer acceptance rate reaches 25%, 50%, and 75%
respectively. For example, when p=0.01 and q=0.3, ABM simulation (Simulation 1,
proportion of influencers = 10%, proportion of innovators = 1%, random network)
shows that it takes 30, 35, and 39 time steps for the customer acceptance rate
to reach 25%, 50%, and 75% respectively. This is a significantly longer time
step compared to the results of the traditional Bass model (25%: 7.83, 50%:
11.18, 75%: 14.66). This research finding is consistent with some other results
on the comparison of ABM between fully connected networks and Moore networks
@holanda_modelling_nodate.

This difference mainly stems from the differences in the inter-individual
connection assumptions between the two models. The traditional Bass model adopts
the "global knowledge" assumption, that is, each agent is affected by all other
agents, which is equivalent to all agents in the market being connected to each
other. Our ABM model considers more complex individual behaviors and network
structures, and uses random networks and small-world networks that are closer to
reality. This more detailed simulation, while increasing computational time,
more accurately reflects diffusion dynamics in real markets. 

=== Similarities and differences with network diffusion

Similar to many innovation diffusion studies based on ABM, this study also
confirmed that different network structures have a significant impact on the
diffusion process. In particular, the maximum degree in the network (i.e., the
number of connections owned by the most connected node in the network) has a
significant impact on the diffusion time @di_lucchio_bass_2024. As shown in
@label:neighbor_stat_vis, the maximum degree of random networks is usually
higher than that of small-world networks. Our model simulations are consistent
with this, showing that random networks do indeed have higher diffusion rates
than small-world networks.

In addition, our research extends further and introduces the key role of the "influencer".
Through extensive experimental comparisons, we found that a higher proportion of
influencers can significantly accelerate the diffusion of a product. This
phenomenon is reflected in both small-world networks and random networks, and
also reduces the difference in diffusion speed between the two networks.

There are several reasons for this: first, the efficiency of information
dissemination has become higher. Influencers usually have more social
connections and can spread information more quickly and widely. In any network
structure, more influencers mean that information can reach every corner of the
network faster; second, the existence of influencers may make up for the
differences between different network structures. For example, in a small-world
network, influencers can act as a "bridge" to connect different social groups,
thereby accelerating the spread of information.

== Contributions and Implications

=== Contributions

This study provides a more comprehensive understanding of the market diffusion
process by innovatively integrating the Bass diffusion model, complex network
theory, and ABM methods. It not only explores the behaviors and interactions at
the individual level, but also analyzes in detail the impact of different social
network structures, key individuals (such as influencers and innovators), and
multi-factor interactions on the diffusion process. This multidimensional
analytical approach bridges the gap between theoretical models and actual market
conditions, providing valuable insights for academics and practitioners.

More importantly, this study establishes a flexible and scalable market
diffusion research platform. This platform allows researchers to explore the
impact of various parameter combinations, such as different sizes of potential
customer groups (N), different numbers of agents (Agent), and simultaneous
changes in the innovation coefficient (p) and the imitation coefficient (q).
This approach also provides a powerful tool for future researchers to further
explore the complex dynamics of market diffusion.

=== Practical significance

Our research provides marketers with a comprehensive set of strategic
guidelines, highlighting the importance of adopting dynamic and differentiated
strategies based on product lifecycles and market characteristics. In the early
stages of product launch, companies should focus resources on improving the
innovation coefficient (p coefficient), such as increasing advertising
investment and providing trial opportunities. Over time, the strategic focus
should gradually shift to improving the imitation coefficient (q coefficient),
such as encouraging users to share and build communities. This phased strategy
not only optimizes resource allocation, but also effectively responds to market
dynamics.

The key is to identify and cultivate influential innovators, who play a vital
role in accelerating product diffusion. Companies should consider adopting a
phased product launch strategy, first targeting these key individuals and
attracting them through influencer marketing or KOL (key opinion leader)
strategies. With limited resources, focusing resources on a small number of
high-impact innovators may be more effective than trying to increase the overall
number of innovators. In the long run, cultivating lasting relationships with
these innovators, or even building "innovator communities" or "influencer
networks," can become a continuous product development and promotion resource.

Market segmentation and differentiation of network strategies is another key
consideration. Different types of consumers play different roles in the
diffusion process and require targeted strategies. Companies should adjust their
marketing approach based on the network characteristics of the target market
(closer to random networks or small-world networks). For example, in markets
with obvious small-world network characteristics (such as close communities or
professional fields), it may be more appropriate to adopt viral marketing or
word-of-mouth marketing strategies and focus on improving the imitation
coefficient. In contrast, in markets that are closer to random networks (such as
mass consumer goods markets), a wider marketing coverage and a greater focus on
improving the innovation coefficient may be required. This differentiation
strategy also applies to the selection and use of social media platforms.

Finally, our research emphasizes the importance of comprehensive optimization
and dynamic adjustment. Companies should seek a balance between multiple factors
rather than overinvesting in a single aspect. Identifying and exploiting the "critical
point" of parameter combinations may be the key to accelerating market
penetration. At the same time, companies need to be wary of the diminishing
marginal benefits brought about by overinvestment. By building a more accurate
market diffusion prediction model, companies can make more informed decisions
and optimize resource allocation. This comprehensive approach is not only
applicable to corporate strategies, but also has important implications for
innovation policy making, which helps to create a balanced innovation ecosystem
and accelerate the diffusion of technology or products on a wider scale.

== Limitations and Future Research

=== Limitations of the Model

Although this study has made significant progress in market diffusion modeling,
it still has some limitations. First, the heterogeneity of agents is mainly
reflected in two dimensions: whether they are innovators and whether they are
influencers, which may oversimplify the complexity of consumers in reality.
Secondly, the innovation coefficient (p) and imitation coefficient (q) in the
model remain unchanged throughout the diffusion process and cannot reflect the
dynamic changes in the market, especially the possible cyclical fluctuations in
innovation effects. For example, the innovation effect of some products may show
cyclical changes due to the influence of seasons, advertising cycles or economic
cycles. Furthermore, the network structure is determined at the beginning of the
simulation, without taking into account the dynamic evolution characteristics of
social networks. And q may changes as well. Furthermore, despite using
small-world networks and random networks, this may still not fully capture the
more complex social network structure in the real world. Finally, the accuracy
and generalization ability of the model may be limited due to the lack of
validation with actual market data.

=== Future Research Directions

Based on the limitations of the current study, future research can be expanded
in several aspects. First, the heterogeneity of agents can be increased, for
example, innovators can be further subdivided into high-probability adopters and
relatively low-probability adopters to better reflect the diversity of consumer
groups. Second, dynamically changing innovation coefficients and imitation
coefficients can be introduced, especially considering the cyclical changes of
the innovation coefficient. For example, the following model can be used to
describe the cyclical changes of the innovation coefficient:

$ p=p_"base"+A sin (omega t+phi) $

Where $p_"base"$ is the basic innovation coefficient, $A$ is the amplitude, $omega$ is
the angular frequency, $phi$ is the phase, and $t$ is the time. This model can
better reflect the cyclical fluctuations in the real market, such as the impact
of seasonal effects, advertising cycles or economic cycles on innovation
adoption.

For the imitation coefficient $q(t)$, we can keep the original growth-and-decay
model, or design it to change periodically according to the specific situation:

$ q(t) = q_"max" (1 - exp(-mu t)) exp(-v t) $

Furthermore, future models can incorporate dynamic changes in network structure,
consider the birth or death of connections between nodes, and more accurately
simulate the evolution of social networks. In addition, research can explore
more complex network topologies, such as multi-layer networks or networks built
based on actual social media data. Finally, future work should focus on
collecting actual market data for model verification and calibration to improve
the practicality and reliability of the model. These directions can not only
improve current models, but also provide new perspectives and insights for
innovation diffusion research, helping us better understand and predict the
innovation diffusion process in complex market environments.

= Conclusion

This study provides a more comprehensive understanding of the market diffusion
process by innovatively integrating the Bass diffusion model, complex network
theory, and agent-based model (ABM) methods. We deeply explore the impact of
factors such as innovation coefficient, imitation coefficient, influencer ratio,
consumer group heterogeneity, and social network structure on product diffusion,
revealing the complex interactions between them. These findings enrich the
traditional innovation diffusion theory.

Although this study has some limitations in terms of agent heterogeneity and
network dynamics, it has built a flexible and scalable platform for future
research. We hope to have a deeper understanding of the innovation diffusion
process based on the conclusions of this study, provide stronger support for
corporate decision-making and policy making, and ultimately promote the rapid
and effective dissemination of innovation on a wider range.

#bibliography("references.fixed.bib")

#set heading(numbering: none)

= Appendix A: Model Code

= Appendix B: Words Count

In this document, there are #total-words words all up.