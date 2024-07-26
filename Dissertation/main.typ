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
  abstract: lorem(59+11),
  date: today.display("[month repr:long] [day], [year]"),
)

// ------------------------------------------------
// outline part
#show link: underline
#show outline.entry.where(level: 1): it => {
  v(12pt, weak: true)
  strong(it)
}
#outline(indent: auto)
// ------------------------------------------------

= Introduction and Literature Review

== Introduction

This project aims to investigate the market diffusion of a new product using agent-based modelling. The project will focus on the adoption of a new product by consumers and the impact of different marketing strategies on the diffusion process. The research will explore how agents interact with each other and make decisions based on their preferences and the information they receive. The project will also investigate the effect of social networks on the diffusion process and how they influence the adoption of the new product. @Helfmann2023


#figure(image("img/boxplot_p_change.svg", width: 100%), caption: [Test of svg image 123])

#bibliography("references.bib")