#import "@preview/cetz:0.2.2"
#import "@preview/suiji:0.3.0": *

#let fig(step) = cetz.canvas(length: 5mm, {
  import cetz: draw
  import cetz.draw: *

  let rng = gen-rng(42)

  // Regolarizzazione del modulo, da fare meglio con epsilon relativo
  let R(px, py, pz) = {
    let epsilon = 0.05 * 4;
    return calc.sqrt(px * px + py * py + pz * pz + epsilon * epsilon);
  }

  let cross(ax, ay, az, bx, by, bz) = {
    return (
      ay * bz - az * by,
      az * bx - ax * bz,
      ax * by - ay * bx
    );
  }

  // Potenziale di Dirac REGOLARIZZATO
  let A((px, py, pz)) = {
    let nx = 0.0;
    let ny = -1.0;
    let nz = 0.0;
    let (cx, cy, cz) = cross(px, py, pz, nx, ny, nz);
    return (
      1. / R(px, py, pz) * cx / (R(px, py, pz) - (px * nx + py * ny + pz * nz)),
      1. / R(px, py, pz) * cy / (R(px, py, pz) - (px * nx + py * ny + pz * nz)),
      1. / R(px, py, pz) * cz / (R(px, py, pz) - (px * nx + py * ny + pz * nz)),
    );
  }

  let sub((ax, ay, az), (bx, by, bz)) = {
    return (ax - bx, ay - by, az - bz);
  }

  let add((ax, ay, az), (bx, by, bz)) = {
    return (ax + bx, ay + by, az + bz);
  }

  let add_2((ax, ay), (bx, by)) = {
    return (ax + bx, ay + by);
  }

  let div((ax, ay, az), b) = {
    return (ax / b, ay / b, az / b);
  }

  let mul_2((ax, ay), b) = {
    return (ax * b, ay * b);
  }

  let normalize_2((x, y)) = {
    let r = calc.sqrt(x * x + y * y);
    return (x / r, y / r);
  }

  // Campo magnetico come rotore di A
  let B(p) = {
    let h = 0.001;
    let (dx_Ax, dx_Ay, dx_Az) = div(sub(A(add(p, (h, 0., 0.))), A(sub(p, (h, 0., 0.)))), (2. * h));
    let (dy_Ax, dy_Ay, dy_Az) = div(sub(A(add(p, (0., h, 0.))), A(sub(p, (0., h, 0.)))), (2. * h));
    let (dz_Ax, dz_Ay, dz_Az) = div(sub(A(add(p, (0., 0., h))), A(sub(p, (0., 0., h)))), (2. * h));
    return (
      dy_Az - dz_Ay,
      dz_Ax - dx_Az
    );
  }

  rect(
    (-10, -10),
    (10, 10),
    stroke: none,
  )

  for j in range(0, 2000) { // 2000
    let x0 = 0;
    let y0 = 0;
    let w = 15.0;
    (rng, (x0,)) = uniform(rng, low: -w, high: w, size: 1)
    (rng, (y0,)) = uniform(rng, low: -9.0, high: 9.0, size: 1)
    //rect(
    //  (x0, y0),
    //  (x0 + 0.2, y0 + 0.2),
    //  fill: black,
    //  stroke: none
    //);

    let color_map(B) = {
        let t = calc.max(calc.min(calc.log(calc.sqrt(B.at(0) * B.at(0) + B.at(1) * B.at(1))) + 2.2, 1.0), 0.0);
        let c1 = teal;
        let c2 = green;
        let c2 = purple;
        let col = color.mix(
          (c1.transparentize(20%), 1 - t),
          (c2.transparentize(20%), t),
        );
        col
    };

    let positions = {
      let N = 5;
      let positions = ();
      if j == 0 {
        continue;
      }
      let p = (x0, y0);
      positions.push((p, color_map(B((x0, y0, 0.0)))));
      for i in range(0, N) {
        let (px, py) = p;
        let B = B((px, py, 0.0));

        let col = color_map(B);

        let dir = normalize_2(B);
        let dp = mul_2(dir, 1.0 / N);
        p = add_2(p, dp);
        positions.push((p, col));
      }
      positions
    };

    for i in range(0, positions.len() - 1) {
      line(
        positions.at(i).at(0),
        positions.at(i + 1).at(0),
        stroke: (
          thickness: 1.0pt,
          cap: "round",
          paint: positions.at(i).at(1),
        ),
      );
    }
  }

  let xx = (
    0.05,
    0.15,
    0.25,
    0.4,
    0.65,

    -0.05,
    //-0.15,
    -0.25,
    -0.4,
    -0.65,
  );
  for x in xx {
    let N = 100;
    let K = 2;
    let positions = {
      let positions = ();
      let p = (x, -10.0);
      positions.push(p);
      for i in range(0, N) {
        let (px, py) = p;
        let B = B((px, py, 0.0));
        let dir = normalize_2(B);
        let dp = mul_2(dir, 20 / N);
        p = add_2(p, dp);
        let (px, py) = p;
        if (calc.rem(i, K) == 0) and px > -10.0 and px < 10.0 and py > -10.0 and py < 10.0 {
          positions.push(p);
        }
      }
      positions
    };

    for i in range(0, positions.len() - 1) {
      if i == positions.len() - 2 {
        line(
          positions.at(i),
          positions.at(i + 1),
          stroke: (thickness: 1.5pt, cap: "round", paint: black.lighten(0%)),
          mark: (end: "stealth"),
        );
      } else {
        line(
          positions.at(i),
          positions.at(i + 1),
          stroke: (thickness: 1.5pt, cap: "round", paint: black.lighten(0%))
        );
      }
      //panic(positions.at(i+1));
    }
  }

  circle(
    (0, 0),
    radius: 0.75,
    fill: blue,
    stroke: none
  )

  line(
    (0, 0),
    (-8.5, 6.5),
    stroke: (thickness: 0.75pt, cap: "round", paint: black.lighten(0%)),
    mark: (end: "stealth"),
  )

  group({
    rotate(-2.225);
    arc(
      (0,0),
      start: -90deg,
      stop: -55deg,
      anchor: "origin",
      radius: 2.0,
    );
    scale(4.0);
    circle((0,-2), radius: (1.35, 0.25))
  })

  line(
    (0, 0),
    (4, -2.5),
    stroke: (thickness: 2pt, cap: "round", paint: green.darken(30%)),
    mark: (end: "stealth"),
  )

  content((-3, -5.0), [
    #set text(size: 10mm, green.darken(30%))
    #show: it => box(it, fill: black.lighten(100%).transparentize(20%), inset: 0.25em, radius: 0.25em)
    $bold(tilde(L))$
  ])

  line(
    (0, 0),
    (-0.5, -4),
    stroke: (thickness: 4pt, cap: "round", paint: green.darken(20%)),
    mark: (end: "stealth"),
  )

  content((3, -4.0), [
    #set text(size: 10mm, green.darken(30%))
    #show: it => box(it, fill: black.lighten(100%).transparentize(20%), inset: 0.25em, radius: 0.25em)
    $bold(L)$
  ])

  circle(
    (-8, 0.5),
    radius: 0.3,
    fill: red,
    stroke: none
  )

  bezier(
    (-8, 0.5),
    (-3, 2.5),
    (-6, 0.5),
    stroke: (thickness: 1.0pt, cap: "round", paint: red, dash: "dashed"),
    mark: (end: "stealth"),
  )

  content((-2.5, 0.9), [
    #set text(size: 5mm, black)
    #show: it => box(it, fill: black.lighten(100%).transparentize(20%), inset: 0.25em, radius: 0.25em)
    $theta$
  ])

  content((-8, -1.0), [
    #set text(size: 10mm, red)
    #show: it => box(it, fill: black.lighten(100%).transparentize(20%), inset: 0.25em, radius: 0.25em)
    $bold(e)$
  ])

  content((3, 1.5), [
    #set text(size: 15mm, blue)
    #show: it => box(it, fill: black.lighten(100%).transparentize(20%), inset: 0.25em, radius: 0.25em)
    $bold(g)$
  ])

  content((7,3), [
    #set text(size: 15mm)
    #show: it => box(it, fill: black.lighten(100%).transparentize(20%), inset: 0.25em, radius: 0.25em)
    $arrow(B)$
  ])
})

//#set page(margin: 0pt, width: 1000pt, height: 1000pt)
//#set page(width: auto, height: auto, margin: 1cm)
//#rect(fig, inset: 0pt, width: 8cm, height: 6cm)
#rect(fig(0))
