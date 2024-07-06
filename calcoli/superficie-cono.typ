
#set math.equation(numbering: "(1)")
#set heading(numbering: "1.")

== Dinamica di $e-m$ come particella vincolata su un cono

Considero una particella vincolata su una superficie. Localmente parametrizzo la superficie con $(u, v)$ ortogonali. Nell'intorno dell'origine:
$
z(u, v) = 1/2 mat(u, v) H vec(u, v) + o(sqrt(u^2 + v^2))
$
con $H$ l'essiana:
$
H_(i j) = lr(mat(
  diff_(u u), diff_(u v);
  diff_(v u), diff_(v v);
) z(u, v) |)_(u = 0, v = 0)
$

Se considero una particella libera che si muove con velocità $(u, v)$, avrò:
$
a_z = diff_t^2 z = diff_t [mat(t u, t v) H vec(u, v)] = mat(u, v) H vec(u, v)
$ <acc-curvature-hessian>

Nel nostro caso, considero che la particella si trovi sull'asse delle $z$, allora scompongo la velocità:
$
arrow(v) = (arrow(v) dot hat(z)) hat(z) + arrow(v) - (arrow(v) dot hat(z)) hat(z) eq.def v_z hat(z) + arrow(v)_T
$
Per cui la forza di lorentz:
$
arrow(F) = e arrow(v) times arrow(B) underbracket(=, arrow(B) = vec(0, 0, B)) e B space  arrow(v)_T times hat(z)
$
Se impongo $v_x = 0$:
$
arrow(F)/m = e/m B v_y hat(x)// - e B v_x hat(y) = e B v_y hat(x)
$

Ora utilizzando @acc-curvature-hessian con $u -> y$, $v -> z$, $z -> x$:
$
F/m = cases(
  a = mat(v_y, v_z) H vec(v_y, v_z),
  e/m B v_y,
)
$
This must hold for every $v_z$ (TODO non mi torna a matematicamente), so:
$
H = mat(
  H_(1 1), 0;
  0, 0;
)
$
and
$
e/m B v_y = v_y^2 H_(1 1) ==> H_(1 1) = e/m B/(v_y)
$ <sol-for-H11>

Now, on a circle:
$
y &= sqrt(R^2 - x^2) approx R (1 - x^2/(2 R^2))\
&= R - x^2/(2 R)
$
So $H_(1 1) = 1 \/ R$:
$
R = m/e v_y / B
$
as expected. Now, for a monopole, $B = g / z^2$:
$
R = m/(e g) v_y z^2
$

Tornando a @sol-for-H11:
$
H_(1 1) = (e g)/m 1/(v_y) 1 / (z^2)
$