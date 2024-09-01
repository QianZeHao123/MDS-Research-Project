#let simInfo = page(
  paper: "a4",
  // orientation: "landscape",
  flipped: true,
  margin: (left: 20mm, right: 20mm, top: 20mm, bottom: 20mm),
)[
  // #simPlan
  #set text (10pt)
  #figure(
    caption: "The Parameters of the Experiment for Each Simulation",
    align(
      center,
    )[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto),
        inset: 10pt,
        align: center,
        stroke: none,
        table.hline(),
        table.header(
          [],
          [*N*],
          [*p*],
          [*q*],
          [*Agent Proportion*],
          [*Network Type*],
          [*Iterations*],
        ),
        table.hline(),
        [Sim 1],
        [1000],
        [0.01, 0.015, 0.02, 0.025, 0.03],
        [0.3],
        [[0.001, 0.099, 0.009, 0.891]],
        [Small World],
        [25],
        [Sim 2],
        [1000],
        [0.02],
        [0.3, 0.35, 0.4, 0.45, 0.5],
        [[0.001, 0.099, 0.009, 0.891]],
        [Small World],
        [25],
        [Sim 3],
        [1000],
        [0.01],
        [0.3],
        [Prop innovator: 0.01 \ Inf-Inno Prop: 0, 0.003, 0.005, 0.007, 0.01],
        [Small World],
        [25],
        [Sim 4],
        [1000],
        [0.01],
        [0.3],
        [Prop innovator: 0.01 \ Inf-Inno Prop: 0, 0.003, 0.005, 0.007, 0.01],
        [Small World],
        [25],
        [Sim 5],
        [1000],
        [0.01, 0.015, 0.02, 0.025, \ 0.03, 0.045, 0.05],
        [0.3],
        [Prop innovator: 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07 \ 
          Prop Influencer: 0.1],
        [Small World],
        [5],
        [Sim 6],
        [1000],
        [0.01],
        [0.3],
        [Prop innovator: 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07 \
          Prop Influencer: 0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6],
        [Small World],
        [5],
        [Sim 7],
        [1000],
        [0.01, 0.015, 0.02, 0.025, 0.03],
        [0.3],
        [[0.001, 0.099, 0.009, 0.891]],
        [Random],
        [25],
        [Sim 8],
        [1000],
        [0.02],
        [0.3, 0.35, 0.4, 0.45, 0.5],
        [[0.001, 0.099, 0.009, 0.891]],
        [Random],
        [25],
        [Sim 9],
        [1000],
        [0.01],
        [0.3],
        [Prop innovator: 0.01 \ Inf-Inno Prop: 0, 0.003, 0.005, 0.007, 0.01],
        [Random],
        [25],
        [Sim 10],
        [1000],
        [0.01],
        [0.3],
        [Prop innovator: 0.01 \ Inf-Inno Prop: 0, 0.003, 0.005, 0.007, 0.01],
        [Random],
        [25],
        [Sim 11],
        [1000],
        [0.01, 0.015, 0.02, 0.025, \ 0.03, 0.045, 0.05],
        [0.3],
        [Prop innovator: 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07 \ 
          Prop Influencer: 0.1],
        [Random],
        [5],
        [Sim 12],
        [1000],
        [0.01],
        [0.3],
        [Prop innovator: 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07 \
          Prop Influencer: 0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6],
        [Random],
        [5],
        table.hline(),
      )
    ],
  ) <label:simPlan>
]
