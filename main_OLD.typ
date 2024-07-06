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
  - #lorem(10) $integral x^2 = 0$ #lorem(10) 
  - #lorem(20) $ bold(nabla) dot arrow(E) prop partial_bold(x) integral.vol d bold(x) rho(r, phi, theta) $
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
  section: ([PIPPO],),
  steps: 6,
  steps(
    [
      A /*#current-step()*/ simple #pin(1)highlighted text#pin(2). ciao ciao

      #locate(loc => sub-slide-index.at(loc))

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
    steps(switch: true, skip: 4)[
      ```rs
      fn ciao() {
        ciao();
      }
      ```
    ][
      ```rs
      fn ciao() {
        ciao(2);
      }
      ```
    ],
  )
)

#slide(
  section: ([Codice],),
  steps: 5,
  steps(switch: true)[
  ```rs
  fn ciao(a: i32) {}
  ```
][
  ```rs
  fn ciao(a: i32, b: i32, c: i32) {}
  ```
][
  ```rs
  fn ciao(a: i32, b: i32, c: i32) -> i32 {
    todo!();
  }
  ```
][
  ```rs
  fn ciao(a: i32, b: i32, c: i32) -> i32 {
    a + b + c
  }
  ```
][
  ```rs
  /// Doc comment
  fn ciao(a: i32, b: i32, c: i32) -> i32 {
    // comment
    a + b + c
  }
  ```
])

#slide[
  ciao
]

#raw-slide(
  counter-name: "intro-slides",
  counter-display: "I",
)[
  outro
]

//ciao