
#let title = [Monopoli Magnetici]
#set text(lang: "it")

#let page_scale = 35pt

#let logo_path = "img/logo/cherubino_white144.gif"
#let logo_path_2 = "img/logo/cherubino_pant541_144.gif"

#let raw-slide = (
  counter-name: "slide",
  counter-increment: true,
  counter-display: "1",
  section: (text(red)[SECTION], ),
  new-section: true,
  body,
) => page(
  width: 16 * page_scale,
  height: 9 * page_scale,
  margin: 0pt,
  {
    let header_height = 17pt
    let header_stroke_width = 2pt
    let logo_with = 50pt

    if new-section {
      counter(counter-name).step()
    }

    let n_pages = context counter("slide").final().at(0)
    let page_number = counter(counter-name).display(counter-display)

    let section_heading = if section.len() > 0 {
      let section_heading = heading(section.last(), supplement: [section], level: section.len())
      if (counter-increment) {
        place(top + left, hide(section_heading))
      }
      section_heading
    } else {
      []
    }

    place(
      top + right,
      box(
        radius: ( bottom: 50%, ),
        stroke: rgb("#4A7EBB") + header_stroke_width * 2,
        inset: 2pt,
        hide(image(logo_path, width: logo_with)),
      ),
    )
    place(
      top,
      rect(
        fill: rgb("#0F406B"),
        stroke: ( bottom: rgb("#4A7EBB") + header_stroke_width, ),
        width: 100%,
        height: header_height,
        align(horizon, [
          #set text(white, 10pt)
          #title #section.map(s => [ $->$ #s ]).join()
          #place(
            right + horizon,
            dx: -logo_with - 5pt,
            [Università di Pisa - Dipartimento di Fisica],
          )
        ])
      ),
    )
    place(
      top + right,
      box(
        fill: rgb("#0F406B"),
        radius: ( bottom: 50%, ),
        inset: 2pt,
        image(logo_path, width: logo_with),
      ),
    )
    place(
      bottom,
      rect(
        fill: rgb("#0F406B"),
        stroke: ( top: rgb("#4A7EBB") + header_stroke_width, ),
        width: 100%,
        height: header_height,
        align(horizon, [
          #set text(white, 10pt)
          Luca Ciucci - Laurea Triennale 2024/07/17
          #place(
            right + horizon,
            [
              #box(link("https://github.com/LucaCiucci/tesi-triennale", image("img/github/github-mark-white.svg", height: 1em))) #h(0.5em) #box(link("https://creativecommons.org/publicdomain/zero/1.0/", stack(dir: ltr, image("img/CC/cc.svg", height: 1em), image("img/CC/zero.svg", height: 1em)))) #h(1em) #box(width: 3.5em, [#page_number / #n_pages])
            ],
          )
        ])
      ),
    )

    place(
      right + top,
      dx: -2pt,
      dy: logo_with,
      rect(
        width: logo_with * 1.5,
        stroke: none,
        inset: 0pt,
      )[
        #show outline.entry: it => {
          text(
            size: 6pt,
            link(
              it.element.location(),
              if it.element.body == section_heading.body {
                text(blue, weight: "regular", box(width: 1.25em, inset: 0pt, $->$) + [ ] + it.body)
              } else {
                box(width: 1.25em, inset: 0pt, sym.dot.c)+ it.body
              },
            )
          )
        }
        #align(
          left,
          outline(
            depth: 5,
            indent: 5pt,
            fill: [],
            title: [],
            target: heading.where(supplement: [section])
          ),
        )
      ]
    )

    rect(
      //stroke: red,
      stroke: none,
      //fill: red,
      width: 100%,
      height: 100%,
      inset: (
        top: header_height + header_stroke_width + 5pt,
        bottom: header_height + header_stroke_width,
        left: 15pt,
        right: logo_with * 1.5 + header_stroke_width * 2,
      ),
      body
    )
  }
)

// title page
#raw-slide(
  section: ([Cover],),
  //section: (),
  counter-name: "intro-slides",
  counter-display: "I",
)[
  #place(
    center + horizon,
    rect(
      stroke: none,
      align(center, [
        #text(20pt)[Tesi di Laurea Triennale - 2024/07/17]\
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

#raw-slide(
  section: ([QFT], ),
  new-section: true,
)[
  = Quantum Field Theory
  #lorem(40)
]

#raw-slide(
  section: ([QFT], [QED], ),
  new-section: true,
)[
  = Quantum Field Theory
  == Quantum Electrodynamics
  #lorem(40)
]

#raw-slide(
  section: ([Teoria],),
  new-section: true,
)[
  = Teoria
  #lorem(40)
]

#raw-slide(
  section: ([Teoria], [EM],),
  new-section: true,
)[
  = Teoria
  == Elettromagnetismo
  #lorem(40)
]

#raw-slide(
  section: ([Osservazioni Sperimentali],),
  new-section: true,
)[
  = Osservazioni Sperimentali
  #lorem(40)
]

#raw-slide(
  section: ([Osservazioni Sperimentali], [EM Classico],),
  new-section: true,
)[
  = Osservazioni Sperimentali
  == Esperimenti
  #lorem(40)
]

#raw-slide(
  section: ([Osservazioni Sperimentali], [Effetti indiretti],),
  new-section: true,
)[
  = Osservazioni Sperimentali
  == Effetti indiretti
  #lorem(40)
]

#raw-slide(
  section: ([$integral_2^3e^(-1/2 x^2)$],),
  new-section: true,
)[
  = Conclusioni
  #lorem(40)
]

#raw-slide(
  section: ([Conclusioni],),
  new-section: true,
)[
  = Conclusioni
  #lorem(40)
]

#raw-slide[
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

//ciao