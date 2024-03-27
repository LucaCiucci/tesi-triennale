
#let title = [Monopoli Magnetici]

#let page_scale = 35pt

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
  {
    let header_height = 17pt
    let header_stroke_width = 2pt
    let logo_with = 50pt

    if counter-increment {
      counter(counter-name).step()
    }

    let n_pages = context counter("slide").final().at(0)
    let page_number = counter(counter-name).display(counter-display)

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
          Luca Ciucci - Laurea Triennale #data-laurea-d
          #place(
            right + horizon,
            [
              #box(link("https://github.com/LucaCiucci/tesi-triennale", image("img/github/github-mark-white.svg", height: 1em))) #h(0.5em) #box(link("https://creativecommons.org/publicdomain/zero/1.0/", stack(dir: ltr, image("img/CC/cc.svg", height: 1em), image("img/CC/zero.svg", height: 1em))))
              #h(0.5em)
              #box(
                //width: 3.5em,
                [#page_number / #n_pages],
              )
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
              if section.len() > 0 and it.element.body == section.last() {
                text(blue, sym.circle.filled + h(0.5em) + it.body)
              } else {
                sym.circle.stroked + h(0.5em) + it.body
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
        right: logo_with * 1.5 + header_stroke_width * 2,
      ),
      body
    )
  }
)

#let steps = (
  step,
  ..pieces
) => {
  pieces
    .pos()
    .enumerate()
    .map(it => if it.at(0) <= step { it.at(1) } else { hide(it.at(1)) })
    .join()
}

#let slide = (
  section: (),
  steps: (),
  body,
) => {
  if type(body) == "content" {
    raw-slide(
      section: section,
      body
    )
  } else if type(body) == "function" {
    if type(steps) == "integer" {
      steps = range(steps)
    }
    for (index, step) in steps.enumerate() {
      raw-slide(
        section: section,
        counter-increment: step == steps.first(),
        new-section: step == steps.last(),
        sub-step: index,
        sub-steps: steps.len(),
        body(step),
      )
    }
  } else {
    panic("Invalid slide body")
  }
}