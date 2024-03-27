#import "slide.typ": *
#import "@preview/pinit:0.1.3": *

#set document(
  title: title,
  author: (
    "Luca Ciucci",
    "Prof. Mario Rossi",
  ),
  date: data-laurea,
)
#set text(lang: "it")

// title page
#raw-slide(
  //section: ([Cover],),
  section: (),
  counter-name: "intro-slides",
  counter-display: "I",
)[
  #place(
    center + horizon,
    rect(
      stroke: none,
      align(center, [
        #text(20pt)[Tesi di Laurea Triennale - #data-laurea-d]\
        #text(30pt, weight: "bold")[Monopoli Magnetici]

        #text(15pt)[Luca Ciucci]\
        #text(15pt)[Relatore: Prof. Mario Rossi]\
        #text(10pt)[Università di Pisa]\
        #text(10pt)[Dipartimento di Fisica]

        #image(logo_path_2, width: 50pt)
      ])
    ),
  )
]

#slide(
  section: ([QFT], ),
)[
  = Quantum Field Theory
  #lorem(40)
]

#slide(
  section: ([QFT], [QED], ),
)[
  = Quantum Field Theory
  == Quantum Electrodynamics
  #lorem(40)
]

#slide(
  section: ([Teoria],),
)[
  = Teoria
  #lorem(40)
]

#slide(
  section: ([Teoria], [EM],),
)[
  = Teoria
  == Elettromagnetismo
  #lorem(40)
]

#slide(
  section: ([Osservazioni Sperimentali],),
)[
  = Osservazioni Sperimentali
  #lorem(40)
]

#slide(
  section: ([Osservazioni Sperimentali], [EM Classico],),
)[
  = Osservazioni Sperimentali
  == Esperimenti
  #lorem(40)
]

#slide(
  section: ([Osservazioni Sperimentali], [Effetti indiretti],),
)[
  = Osservazioni Sperimentali
  == Effetti indiretti
  #lorem(40)
]

#slide(
  section: ([$integral_2^3e^(-1/2 x^2)$],),
)[
  = Conclusioni
  #lorem(40)
]

#slide(
  section: ([Conclusioni],),
)[
  = Conclusioni
  #lorem(40)
]

#slide[
  #rect(
    height: 100%,
    width: 100%,
    fill: blue,
    )[
      == Ciao
      === Ciao
      #lorem(40)
    ]
]

#slide(
  steps: 5,
  (step) => steps(
    step,
    [
      A #step simple #pin(1)highlighted text#pin(2). ciao

      $
      #pin(5)e^(2#pin(3))#pin(4)
      $
    ],
    [
      #pinit-point-from(1)[It is simple.]
      $
      #pin(5)e^(2#pin(3))#pin(4)
      $
    ],
    [
      #pinit-highlight(1, 2)
    ],
  )
)

#slide[
  ciao
]

//ciao