// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", subtitle: "", abstract: [], authors: (), date: none, body) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(
    margin: (left: 25mm, right: 25mm, top: 30mm, bottom: 30mm),
    numbering: "1",
    number-align: center,
    // header: align(right)[Durham University, Department of Natural Sciences],
    header: [
      #set text(8pt)
      Department of Natural Sciences, Durham University
      #h(1fr) MDS Research Project
    ],
  )
  set text(font: "Linux Libertine", lang: "en")
  // set text(font: "Arial", lang: "en")
  set heading(numbering: "1.1")
  
  // set bibliography(title: "References", style: "chicago-author-date")
  set bibliography(title: "References", style: "apa")
  
  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, title))
    #v(1em, weak: true)
  ]
  // Subtitle row.
  align(center)[
    #block(text(weight: 700, 1.25em, subtitle))
    #v(1em, weak: true)
    #date
  ]
  
  // Author information.
  pad(top: 0.5em, x: 2em, grid(
    columns: (1fr,) * calc.min(3, authors.len()),
    gutter: 1em,
    ..authors.map(author => align(center)[
      *#author.name* \
      #author.email
    ]),
  ))
  
  // Abstract.
  pad(
    x: 2em,
    top: 1em,
    bottom: 1.1em,
    align(
      center,
    )[
      #heading(outlined: false, numbering: none, text(0.85em, smallcaps[Abstract]))
      #abstract
    ],
  )
  
  // Main body.
  set par(justify: true)
  
  body
}

#let appendix(body) = {
  set heading(numbering:"A.1") 
  counter(heading).update(0)
  body
}