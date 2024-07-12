#set page(paper: "a4", margin: 10pt)

#import "@preview/cetz:0.2.2"

#let fig(step) = cetz.canvas(length: 1mm, {
  import cetz: draw
  import cetz.draw: *

  let i_min = -2
  let i_max = 3
  let j_min = -3
  let j_max = 4

  let k = 4

  let dyon_charge(i, j) = (20 * j + k * i + 50, 20 * i + 50)

  for i in range(i_min, i_max) {
    line((-20, 50 + 20 * i), (120, 50 + 20 * i), stroke: (paint: gray, thickness: 1))
  }
  for j in range(j_min, j_max) {
    line((50 + 20 * j - 10, 0), (50 + 20 * j + 10, 100), stroke: (paint: gray, thickness: 1))
  }
//
  //for i in range(i_min, i_max) {
  //  for j in range(j_min, j_max) {
  //    line(dyon_charge(i, j), dyon_charge(i, j + 1), stroke: (thickness: 2pt, paint: gray))
  //    line(dyon_charge(i + 1, j), dyon_charge(i, j), stroke: (thickness: 2pt, paint: gray))
  //  }
  //}

  line(
    (-20, 50),
    (130, 50),
    stroke: (thickness: 3pt, cap: "round", paint: red),
    mark: (end: "stealth"),
  )

  line(
    (50, 0),
    (50, 110),
    stroke: (thickness: 3pt, cap: "round", paint: blue),
    mark: (end: "stealth"),
  )

  for i in range(i_min, i_max) {
    for j in range(j_min, j_max) {
      let p = dyon_charge(i, j);
      circle(p, fill: black, radius: 1.5)
      content((p.at(0), p.at(1) - 7), text(13pt, [*_(#i,#j)_*]))
    }
  }

  content((127, 46), text(13pt, fill: red.darken(25%), [$"Re"(e + i g)$]))
  content((127, 56), text(25pt, fill: red.darken(0%), [*e*]))

  content((65, 105), text(13pt, fill: blue.darken(25%), [$"Im"(e + i g)$]))
  content((45, 105), text(25pt, fill: blue.darken(0%), [*g*]))
})


//#rect(fig(0))
#fig(0)