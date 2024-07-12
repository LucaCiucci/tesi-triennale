#set page(paper: "a4", margin: 10pt)

#import "@preview/cetz:0.2.2"

#let fig(step) = cetz.canvas(length: 1mm, {
  import cetz: draw
  import cetz.draw: *

  line((0, 0), (40, 0), stroke: (thickness: 2pt, ), mark: (end: "stealth"),)
  line((0, 0), (0, 40), stroke: (thickness: 2pt, ), mark: (end: "stealth"),)
  line((0, 0), (-20, -30), stroke: (thickness: 2pt, ), mark: (end: "stealth"),)
  content((-15, -30), text(20pt, $bold(x)$))
  content((37, -5), text(20pt, $bold(y)$))
  content((5, 35), text(20pt, $bold(z)$))

  content((0, 0), image("i.svg", width: 70mm))

  line((10, -5), (10, -12), stroke: (thickness: 0.5pt, ))
  line((10, 10), (10, -5), stroke: (thickness: 2pt, ), mark: (end: "stealth"),)
  line((10, -27), (10, -12), stroke: (thickness: 2pt, ), mark: (end: "stealth"),)
  content((15,-17), text(30pt, [*#sym.epsilon*]))


  content((-10, 17), text(30pt, $bold(R^N)$))
  content((-5, -20), text(30pt, $bold(R^S)$))
})


//#rect(fig(0))
#fig(0)