
#let title = [Monopoli Magnetici]

#let page_scale = 35pt

//#let __slide-final-only = state("slide-final-only", false)
#let slide-final-only = if sys.inputs.keys().contains("compact-slides") {
  lower(sys.inputs.compact-slides) == "true"
} else {
  false
}

#let slide-final-result = if sys.inputs.keys().contains("final") {
  lower(sys.inputs.final) == "true"
} else {
  false
}

#let sub-slide-index = state("sub-slide-index", 0)

#let config-slides(
  //final-only: none,
) = {
  //if final-only != none {
  //  __slide-final-only.update(final-only)
  //}
}

#let data-laurea = datetime(
  year: 2024,
  month: 7,
  day: 17,
);
#let data-laurea-d = data-laurea.display("[year]/[month]/[day]")

#let logo_path = "img/logo/cherubino_white144.gif"
#let logo_path_2 = "img/logo/cherubino_pant541_144.gif"

#let theme_blue = rgb("#0F406B")
#let theme_blue_light = rgb("#4A7EBB")

#let pause = metadata((
  lc-type: "pause",
))

#let raw-slide = (
  counter-name: "slide",
  counter-increment: true,
  counter-display: "1",
  section: (),
  new-section: true,
  side-content: [],
  sub-step: 0,
  sub-steps: 0,
  body,
) => page(
  width: 16 * page_scale,
  height: 9 * page_scale,
  margin: 0pt,
  flipped: false,
  {
    let header_height = 17pt
    let header_stroke_width = 2pt
    let logo_with = 50pt

    if counter-increment {
      counter(counter-name).step()
    }

    let n_pages = context counter("slide").final().at(0)
    let slide_number_display = counter(counter-name).display(counter-display)

    if section.len() > 0 {
      let section_heading = heading(section.last(), supplement: [section], level: section.len())
      if (new-section) {
        place(center + top, hide(section_heading))
      }
    }

    place(top + left, rect(stroke: none, fill: white, width: 100%, height: 100%))

    place(
      top + right,
      box(
        radius: ( bottom: 50%, ),
        stroke: theme_blue_light + header_stroke_width * 2,
        inset: 2pt,
        hide(image(logo_path, width: logo_with)),
      ),
    )
    place(
      top,
      rect(
        fill: theme_blue,
        stroke: ( bottom: theme_blue_light + header_stroke_width, ),
        width: 100%,
        height: header_height,
        align(horizon, [
          #set text(white, 10pt)
          #title #section.map(s => [ $->$ #s ]).join()
          #place(
            right + horizon,
            dx: -logo_with - 5pt,
            text(size: 8pt)[Università di Pisa - Dipartimento di Fisica],
          )
        ])
      ),
    )
    place(
      top + right,
      box(
        fill: theme_blue,
        radius: ( bottom: 50%, ),
        inset: 2pt,
        image(logo_path, width: logo_with),
      ),
    )
    place(
      bottom,
      rect(
        fill: theme_blue,
        stroke: ( top: theme_blue_light + header_stroke_width, ),
        width: 100%,
        height: header_height,
        align(horizon, [
          #set text(white, 10pt)
          Luca Ciucci - Appello Laurea Triennale #data-laurea-d
          #place(
            right + horizon,
            [
              #box(
                width: 4em,
                //stroke: red,
                if sub-steps <= 5 {
                  align(
                    left,
                    " " + range(sub-steps)
                      .map(s => if s <= sub-step { sym.circle.filled } else { sym.circle.stroked })
                      .join(),
                  )
                } else {
                  align(
                    left,
                    rect(
                      width: 100%,
                      height: 0.75em,
                      stroke: white,
                      radius: 50%,
                      inset: if sub-step == sub-steps - 1 { 0pt } else { 2pt },
                      rect(
                        width: (sub-step + 1) * 100% / sub-steps,
                        height: 100%,
                        radius: 50%,
                        fill: white,
                        stroke: none,
                      ),
                    )
                  )
                },
              )
              #box(
                //width: 3.5em,
                [#slide_number_display / #n_pages],
              )
              #h(1.0em)
              #box(link("https://creativecommons.org/publicdomain/zero/1.0/", stack(dir: ltr, image("img/CC/cc.svg", height: 1em), image("img/CC/zero.svg", height: 1em))))
              #h(0.5em)
              #box(link("https://github.com/LucaCiucci/tesi-triennale", image("img/github/github-mark-white.svg", height: 1em)))
            ],
          )
        ])
      ),
    )

    place(
      right + top,
      dx: -2pt,
      dy: logo_with + 5pt,
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
              if section.len() > 0 and it.element.body == section.last() {
                text(blue, sym.circle.filled + h(0.5em) + it.body)
              } else {
                context if counter(page).at(it.element.location()).at(0) < counter(page).get().first() { sym.circle.filled } else { sym.circle.stroked } + h(0.5em) + it.body
              },
            )
          )
        }
        #align(
          left,
          [
            #outline(
              depth: 5,
              indent: 5pt,
              fill: [],
              title: [],
              target: heading.where(supplement: [section])
            )

            #side-content
          ],
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
        right: logo_with * 1.5 + header_stroke_width * 2 + 1em,
      ),
      {
        show link: link => text(link, rgb("#0000CD").darken(50%))
        show ref: ref => text(ref, rgb("#0000CD").darken(50%))
        body
      },
    )
  }
)

#let current-step() = [#sub-slide-index.get()]

#let steps = (
  switch: false,
  skip: 0,
  ..pieces
) => {
  locate(loc => {
    let step = sub-slide-index.at(loc)
    if switch {
      pieces
        .pos()
        .enumerate()
        .map(it => if it.at(0) + skip == step or (step > it.at(0) and it.at(0) + 1 == pieces.pos().len() + skip) { it.at(1) } else { [] })
        .join()
    } else {
      pieces
        .pos()
        .enumerate()
        .map(it => if it.at(0) + skip <= step { it.at(1) } else { hide(it.at(1)) })
        .join()
    }
  })
}

#let slide(
  section: (),
  steps: (),
  body,
) = {
  if steps == () {
    return raw-slide(
      section: section,
      body,
    )
  }
  if type(steps) == "integer" {
    steps = range(steps)
  }
  if slide-final-only {
    let step = steps.last()
    raw-slide(
      section: section,
      counter-increment: true,
      new-section: true,
      [#sub-slide-index.update(steps.len())] + body,
    )
  } else {
    for (index, step) in steps.enumerate() {
      raw-slide(
        section: section,
        counter-increment: step == steps.first(),
        new-section: step == steps.last(),
        sub-step: index,
        sub-steps: steps.len(),
        [#sub-slide-index.update(index)] + body,
      )
    }
  }
}

#let non-slide(
  color: gray,
  header: [HEADER],
  body
) = if not slide-final-result {
  page(
    width: 16 * page_scale,
    height: 9 * page_scale,
    margin: 1cm,
    flipped: false,
    header: [
      #rect(
        width: 100%,
        stroke: color + 2pt,
        radius: 2pt,
        fill: color.lighten(80%),
        align(center)[
          #text(black, header)
        ]
      )
    ],
    {
      set heading(numbering: "1.")
      set math.equation(numbering: "(1)")
      body
    }
  )
} else {}

#let note(body) = non-slide(
  color: green,
  header: [#emoji.book.open *Note* #emoji.book.open],
  body
)

#let script(body) = non-slide(
  color: blue,
  header: [#emoji.scroll *Script* #emoji.scroll],
  text(size: 1.25em, body)
)

#let abstract(body) = non-slide(
  color: purple,
  header: [#emoji.page *Long Abstract* #emoji.page],
  {
    import "@preview/wordometer:0.1.2"
    let n-chars = wordometer.extract-text(body).trim().len()

    let expected = 3000
    let tolerance = 300
    
    body

    place(bottom + right)[
      Lunghezza: #if calc.abs(n-chars - expected) < tolerance { text(green)[#n-chars] } else { text(red)[#n-chars] } / #expected #sym.plus.minus #tolerance caratteri
    ]
  }
)

#let cols(..columns) = {
  // take positional list:
  let columns = columns.pos();

  let n = columns.len();

  let columns = columns.map(it => box(
    //fill: red,
    //stroke: red,
    width: 100% / n,
    height: 100%,
    it
  ))


  stack(
    dir: ltr,
    spacing: 5pt,
    ..columns
  )
}