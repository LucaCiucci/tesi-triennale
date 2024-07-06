#import "@preview/cetz:0.2.2"

#let fig(step) = cetz.canvas(length: 1mm, {
  import cetz: draw
  import cetz.draw: *

  line((0, 0), (10, 10), stroke: (thickness: 0.4pt, cap: "round"))

  let r = 30

  circle((50, 50), radius: r, stroke: (thickness: 0.5pt))

  line((50, 50), (50, 10))
  circle((50, 50), radius: 1.5, fill: red.darken(20%), stroke: none)

  let n = 4
  let ratio = 1 / 10

  for i in range(-n + 1, n) {
    let z = i * r / n
    let a = 1 - i / n
    let rx = calc.sqrt(r*r - z*z)
    circle((50, z + 50), radius: (rx, rx * ratio), stroke: (thickness: 0.5pt, cap: "round", paint: gray))
    draw.line((50, z + 50 - rx * ratio), (50 + a * 5 + 3, z + 50 - rx * ratio), stroke: (thickness: 2pt, paint: orange), mark: (end: ">", fill: orange))
  }


  draw.rect(
    (0, 0),
    (100, 100),
    stroke: none,
  )
})

//#set page(margin: 0pt, width: 1000pt, height: 1000pt)
//#set page(width: auto, height: auto, margin: 1cm)
//#rect(fig, inset: 0pt, width: 8cm, height: 6cm)
#rect(fig(0))
