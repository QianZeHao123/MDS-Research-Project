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
approach used to study and understand the dynamic behavior of complex systems @macal_tutorial_2005.
The core concept of ABM is to evaluate the impact on an entire system by
simulating the behavior and interactions of numerous autonomous individuals
within it, known as agents. The fundamental premise of ABM is that even complex
phenomena can be understood and simulated through a series of autonomous agents
following specific interaction rules @zheng_primer_2013.

Unlike traditional equation-based modeling methods, ABM employs a rule-based
approach to construct models @dorri_multi-agent_2018, making it particularly suitable for simulating complex dynamic systems. In ABM, each agent is endowed with the ability to make autonomous decisions @macal_agent-based_2009, acting based on its own state, surrounding environment,
and interactions with other agents @macal_everything_2016. These agents not only influence their physical and social environment but are also influenced by it, forming an intricate network of interactions.

A key feature of ABM is its capacity to capture heterogeneity within a system, allowing for the simulation of agents with diverse characteristics and behaviors, thus more accurately reflecting the diversity of the real world. Through ABM, researchers can observe and analyze how complex behaviors and patterns at the system level emerge from simple rules at the individual level. This "bottom-up" modeling approach makes ABM a powerful tool for studying emergent phenomena, adaptive behaviors, and the evolution of complex systems.

In ABM, agents are core elements with multiple characteristics, including autonomy, heterogeneity, proactivity, and reactivity. They can make independent decisions, interact with each other, learn and adapt, perceive their environment, and act according to specific rules @davidsson_multi_2001. Agents typically possess bounded rationality, goal-oriented behavior, and variable internal states. These features enable ABM to effectively simulate individual behaviors and overall dynamics in complex systems.

=== ABM modeling process and technical implementation



== Philosophy of Building ABM

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


