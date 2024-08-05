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
#outline(title: [Table of Contents], indent: auto)
#outline(title: [List of Tables], target: figure.where(kind: table))
#outline(title: [List of Figures], target: figure.where(kind: image))
// ------------------------------------------------

= Introduction and Literature Review

== Introduction

== Literature Review

=== Agent-based Modelling Simulation

=== Diffusion of Innovation and Bass Model

=== Influencers and Opinion Leaders in Diffusion

=== Network Structure and Diffusion

=== Conclusion of Literature Review

= Methodology

= Simulation and Results Analysis

== Design of the Experiment

#import "./Tables/simulationPlan.typ": simPlan
#simPlan


test of references @Helfmann2023

#bibliography("references.bib")


