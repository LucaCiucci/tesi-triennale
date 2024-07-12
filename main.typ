#import "slide.typ": *
#import "@preview/pinit:0.1.3": *

#set text(size: 9pt)

#set math.equation(supplement: "Eq.")
//#show math.equation: set text(9pt)

#set document(
  title: title,
  author: (
    "Luca Ciucci",
    "Prof. Stefano Bolognesi",
  ),
  date: data-laurea,
)
#set text(lang: "it")

// ================================================================
//                            TITOLO
// ================================================================
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
        #text(15pt)[Tesi di Laurea Triennale - #data-laurea-d]\
        #text(30pt, weight: "bold")[Monopoli Magnetici]\

        #text(15pt)[Candidato: *Luca Ciucci*]\
        #text(15pt)[Relatore: Prof. Stefano Bolognesi]\
        #text(10pt)[Università di Pisa]\
        #text(10pt)[Dipartimento di Fisica]

        #image(logo_path_2, width: 50pt)

        #set quote(block: true)
        //#text(10pt, style: "italic")[#quote(attribution: [Yakov M. Shni])[The theory of monopoles is rich in paradoxes, both real and fictional]]
      ])
    ),
  )
]

// ================================
//            ABSTRACT
// ================================

#abstract[

Sin dalla formulazione delle equazioni di Maxwell, l'esistenza dei monopoli magnetici è stata oggetto di ricerca teorica e sperimentale. Questo elaborato esplora alcuni aspetti teorici significativi sulle proprietà dei monopoli magnetici derivanti dalla consistenza della teoria dei potenziali elettromagnetici e delle loro proprietà topologiche, con particolare attenzione alla quantizzazione della carica elettrica e magnetica

Si osserva che la simmetria $U(1)$ delle equazioni di Maxwell sembra contemplare la presenza di cariche magnetiche. Viene quindi introdotto il problema della conservazione del momento angolare, che rimane costante considerando il contributo dato dal tensore degli stress del campo elettromagnetico oppure considerando un termine aggiuntivo $~e g$, con $e$ e $g$ rispettivamente le cariche elettrica e magnetica.

Successivamente si considera la soluzione di Dirac per il potenziale vettore di un monopolo magnetico, che risulta singolare su una stringa. Si osserva che, imponendo l'invarianza di gauge, il campo da essa generato non è fisico in quanto trasforma in base alla gauge scelta. In meccanica quantistica, si richiede che l'apporto all'azione dovuto a una trasformazione di gauge non comporti effetti osservabili, ottenendo così una condizione di quantizzazione delle cariche elettrica e magnetica.

Un risultato notevole è che la presenza di un singolo monopolo magnetico nell'universo impone, per consistenza, la quantizzazione della carica elettrica. La condizione è anche equivalente a richiedere che la fase accumulata /*nel path integral*/ dalla funzione d'onda intorno alla stringa sia $2 pi n$, oppure che il termine aggiuntivo al momento angolare conservato abbia autovalori semi-interi.\
Questa condizione può essere generalizzata a coppie di dyoni, trovando che la carica di un dyone risiede su un reticolo $(e, g)$, rompendo la simmetria $U(1)$ delle equazioni di Maxwell.

Un'altra formulazione notevole dei monopoli magnetici, proposta da Wu e Yang, richiede di rappresentare il potenziale vettore tramite un ricoprimento dello spazio con due potenziali di Dirac. Questo elimina la singolarità, mentre la condizione di quantizzazione si ritrova considerando il path integral nella regione di sovrapposizione.\
Tale trattazione si formalizza naturalmente tramite nozioni di topologia e geometria differenziale: le usuali equazioni di Maxwell vivono su fibrato triviale formato dallo spazio e dal campo. La singolarità in un punto invece implica una classificazione di tali fibrati tramite il primo numero di Chern ovvero la carica topologica.

Infine si considera una semplice trattazione relativistica, introducendo alla possibilità di avere due quadripotenziali per descrivere il campo elettromagnetico.

La ricerca di evidenze è stata oggetto di numerosi esperimenti in quanto tali particelle risultano inquadrate nelle GUTs. Sono state concepite diverse metodologie, come ad esepio la ricerca di tracce elettriche su di anelli superconduttori/* o SQUID*/, la radiazione di Cherenkov (/*esperimento MACRO e */AMANDA), l'analisi di segnali radio (ANITA) o l'analisi delle traiettorie sotto l'effetto di un campo magnetico (esperimento MoEDAL).\
Attualmente non sono stati osservati monopoli magnetici, e alcuni esperimenti si concentrano sul fornire limiti superiori alla loro esistenza.

]

#script[
  Buonasera, oggi vi parlerò del tema dei *monopoli magnetici* e di alcune delle loro *proprietà teoriche* deducibili dalle *equazioni di Maxwell* e dalla *Meccanica Qauntisitica*.
]

// ================================================================
//                             1 / 5
// ================================================================

#slide(
  section: ([Dualità $E <-> M$],),
  cols[
   - Apparente simmetria per l'equazione di Poisson: $
  bold(nabla) dot bold(E) = rho_E space ; space bold(nabla) dot bold(B) = rho_B
  $
  - Momento angolare è globalmente conservato (invarianza per rotazioni): $
  bold(tilde(L)) = bold(L) underbracket(cancel(+ space e text(#red.darken(30%), g) bold(hat(r))), bold(L)_(E M) = 1/(4 pi) integral bold(r) times bold(S) = -e g bold(hat(r)))
  $
  - Soluzione tipo del potenziale vettore (singolare su una _stringa_): $
  bold(A)(bold(r), epsilon) = g/R (bold(r) times bold(n))/(R - bold(r) dot bold(n))
  $
  - In generale la conservazione del flusso implica che la trasformazione di Gauge deve essere a singolo valore @yakov:
  $
  delta Phi = integral.cont d bold(ell) dot bold(nabla) lambda = 0 space ==> space lambda(phi + 2 pi) = lambda(phi)
  $
  - La trasformazione della stringa ci dice che il suo campo non è fisico /*#strike[ma dovuto al fatto che usiamo un solo quadri-potenziale]*/
  ][
    #figure[#rect(width: 80%, height: 40%, stroke: none)[
      //figura, magari con #link("https://anvaka.github.io/fieldplay/?cx=0.0017000000000000348&cy=0&w=8.543199999999999&h=8.543199999999999&dt=0.01&fo=0.998&dp=0.009&cm=2&vf=%0A%2F%2F%20Regolarizzazione%20del%20modulo%2C%20da%20fare%20meglio%20con%20epsilon%20relativo%0Afloat%20R%28vec3%20p%29%20%7B%0A%20%20float%20epsilon%20%3D%200.05%3B%0A%20%20return%20sqrt%28p.x%20*%20p.x%20%2B%20p.y%20*%20p.y%20%2B%20p.z%20%2B%20p.z%20%2B%20epsilon%20*%20epsilon%29%3B%0A%7D%0A%0A%2F%2F%20Potenziale%20di%20Dirac%20REGOLARIZZATO%0Avec3%20A%28vec3%20p%29%20%7B%0A%20%20vec3%20n%20%3D%20vec3%280.%2C%20-1.%2C%200.%29%3B%0A%20%20return%201.%20%2F%20R%28p%29%20*%20cross%28p%2C%20n%29%20%2F%20%28R%28p%29%20-%20dot%28p%2C%20n%29%29%3B%0A%7D%0A%0A%2F%2F%20Campo%20magnetico%20come%20rotore%20di%20A%0Avec2%20B%28vec3%20p%29%20%7B%0A%20%20float%20h%20%3D%200.001%3B%0A%20%20vec3%20dx_A%20%3D%20%28A%28p%20%2B%20vec3%28h%2C%200.%2C%200.%29%29%20-%20A%28p%20-%20vec3%28h%2C%200.%2C%200.%29%29%29%20%2F%20%282.%20*%20h%29%3B%0A%20%20vec3%20dy_A%20%3D%20%28A%28p%20%2B%20vec3%280.%2C%20h%2C%200.%29%29%20-%20A%28p%20-%20vec3%280.%2C%20h%2C%200.%29%29%29%20%2F%20%282.%20*%20h%29%3B%0A%20%20vec3%20dz_A%20%3D%20%28A%28p%20%2B%20vec3%280.%2C%200.%2C%20h%29%29%20-%20A%28p%20-%20vec3%280.%2C%200.%2C%20h%29%29%29%20%2F%20%282.%20*%20h%29%3B%0A%20%20return%20vec2%28%0A%20%20%20%20dy_A.z%20-%20dz_A.y%2C%0A%20%20%20%20dz_A.x%20-%20dx_A.z%0A%20%20%29%3B%0A%7D%0A%0A%2F%2F%20main%0Avec2%20get_velocity%28vec2%20p%29%20%7B%0A%20%20vec2%20b%20%3D%20B%28vec3%28p.x%2C%20p.y%2C%200.%29%29%3B%0A%20%20%0A%20%20float%20intensity%20%3D%20length%28b%29%3B%0A%0A%20%20return%20normalize%28b%29%20*%20%28log%28intensity%29%20%2B%203.0%29*0.1%3B%0A%7D&code=%0A%2F%2F%20Regolarizzazione%20del%20modulo%2C%20da%20fare%20meglio%20con%20epsilon%20relativo%0Afloat%20R%28vec3%20p%29%20%7B%0A%20%20float%20epsilon%20%3D%200.05%3B%0A%20%20return%20sqrt%28p.x%20*%20p.x%20%2B%20p.y%20*%20p.y%20%2B%20p.z%20%2B%20p.z%20%2B%20epsilon%20*%20epsilon%29%3B%0A%7D%0A%0A%2F%2F%20Potenziale%20di%20Dirac%20REGOLARIZZATO%0Avec3%20A%28vec3%20p%29%20%7B%0A%20%20vec3%20n%20%3D%20vec3%280.%2C%20-1.%2C%200.%29%3B%0A%20%20return%201.%20%2F%20R%28p%29%20*%20cross%28p%2C%20n%29%20%2F%20%28R%28p%29%20-%20dot%28p%2C%20n%29%29%3B%0A%7D%0A%0A%2F%2F%20Campo%20magnetico%20come%20rotore%20di%20A%0Avec2%20B%28vec3%20p%29%20%7B%0A%20%20float%20h%20%3D%200.001%3B%0A%20%20vec3%20dx_A%20%3D%20%28A%28p%20%2B%20vec3%28h%2C%200.%2C%200.%29%29%20-%20A%28p%20-%20vec3%28h%2C%200.%2C%200.%29%29%29%20%2F%20%282.%20*%20h%29%3B%0A%20%20vec3%20dy_A%20%3D%20%28A%28p%20%2B%20vec3%280.%2C%20h%2C%200.%29%29%20-%20A%28p%20-%20vec3%280.%2C%20h%2C%200.%29%29%29%20%2F%20%282.%20*%20h%29%3B%0A%20%20vec3%20dz_A%20%3D%20%28A%28p%20%2B%20vec3%280.%2C%200.%2C%20h%29%29%20-%20A%28p%20-%20vec3%280.%2C%200.%2C%20h%29%29%29%20%2F%20%282.%20*%20h%29%3B%0A%20%20return%20vec2%28%0A%20%20%20%20dy_A.z%20-%20dz_A.y%2C%0A%20%20%20%20dz_A.x%20-%20dx_A.z%0A%20%20%29%3B%0A%7D%0A%0A%2F%2F%20main%0Avec2%20get_velocity%28vec2%20p%29%20%7B%0A%20%20vec2%20b%20%3D%20B%28vec3%28p.x%2C%20p.y%2C%200.%29%29%3B%0A%20%20%0A%20%20float%20intensity%20%3D%20length%28b%29%3B%0A%0A%20%20return%20normalize%28b%29%20*%20%28log%28intensity%29%20%2B%203.0%29*0.1%3B%0A%7D")[questo sfondo]
      //#include "img/slide_1/monopolo.typ"
      #image("img/slide_1/image_4.png")
    ]]
    Equazioni di Maxwell con sorgente/*per il campo libero*/: $
    bold(nabla) (bold(E) + i bold(B)) &= rho_e + i rho_g\
    bold(nabla) times (bold(E) + i bold(B)) - i diff_t (bold(E) + i bold(B)) &= bold(j)_e + i bold(j)_g,
    $ suggeriscono la simmetria: #math.equation(block: true, numbering: "(1)", $
    D: space (bold(E) + i bold(B), rho_e + i rho_b) -> text(#red.darken(20%), e^(i theta)) (bold(E) + i bold(B), rho_e + i rho_b)
    $)<todo-simm-1> che in particolare non modifica le equazioni di E.L. per il campo libero: $
      cal(L) = - 1/(4 e^2) F_(mu nu) F^(mu nu) = F_(mu nu) = - 1/(2 e^2) (E^2 - B^2)
    $
  ]
)

#script[
  Le equazioni di Maxwell presentano una _dualità_ intrinseca che suggerisce una possibile simmetria tra carica elettrica e magnetica. In particolare viene quasi naturale chiedersi se è possibile scrivere l'*equazione di Poisson* per la *carica magnetica*, e questo lo possiamo fare.

  In ambito classico la prima peculiarità che può venire in mente è la conservazione del *momento angolare*, che di fatti *non si conserva*, come possiamo vedere analizzando un problema di *scattering $e-g$*, in cui la posizione relativa di muove su di un cono, con un *potenziale efficacie sempre repulsivo*, quindi chiaramente non si può conservare.

  In realtà con dei semplici conti #footnote[basta moltiplicare vettorialmente per $arrow(r)$ (RIVEDI)] si può trovare una diversa definizione del momento angolare conservato, comprendente un termine aggiuntivo $~e g hat(r)$.\
  //Comunque questo pezzo non propriamente piacevole non 
  Comunque notiamo che *l'usuale momento angolare è conservato* se si considera anche il contributo del campo elettromagnetico tramite il formalismo del vettore di Poynting, e questo ci piace perché il sistema è invariante per rotazioni.

  E' poi naturale chiedersi come sarebbe fatto il potenziale ti tale oggetto, ed una soluzione particolarmente semplice è il *potenziale di Dirac*, che però risulta singolare su di una stringa.\
  Altri potenziali uni-valori hanno tutti una singolarita su almeno una stringa e questo deriva dal fatto che la divergenza del rotore è nulla. Altre soluzioni al potenziale (come ad esempio quello di #text(red)[?????????] che ha la singolarità su un piano) sono connessi a quello di Dirac tramite combinazioni di trasformazioni di gauge.\
  Questo però ci dice che la stringa dipende dalla gauge, quindi se *richiediamo l'invarianza di gauge* troviamo che *la stringa non può essere fisica*.

  Un'altra osservazione interessante è che le equazioni di Maxwell presentano una simmetria $U(1)$ se combiniamo i campi come parte reale e immaginaria, o comunque $S O(2)$ se vogliamo vedere che le equazioni di Maxwell sono invarianti per nello spazio $(E, B)$.\
  Si può comunque dimostrare che le equazioni di Eulero Lagrange /*dell'usuale Lagrangiana*/ per il campo libero sono invarianti per tale simmetria.

  #place(bottom + right)[$approx$ 2 min]
]

//#note[
//  Le equazioni di maxwell presentano una _dualità_ intrinseca che suggerisce una simmetria tra carica elettrica per l'equazione di poisson:
//  $
//  bold(nabla) dot bold(E) = rho_E space ; space bold(nabla) dot bold(B) = rho_B
//  $
//  sebbene una carica magnetica non sia mai stata osservata sperimentalmente.
//
//  Il momento angolare in un sistema di due particelle non si conserva, ma dalla lagrangiana si conserva la seguente quantità:
//  $
//  bold(tilde(L)) = bold(L) + e text(#red.darken(30%), g) bold(hat(r))
//  $
//  Perché:
//  $
//  bold(L)_(E M) = 1/(4 pi) integral bold(r) times bold(S) = 1/(4 pi) integral bold(r) times bold(S) = ... = -e g bold(hat(r))
//  $
//
//  Poi parlo delle possibili soluzioni che si riescono a scrivere mantenendo un solo potenziale vettore, di cui tutte ricavabili come combinazioni di trasformazioni di gauge del potenziale di Dirac:
//  $
//  bold(A)(bold(r), epsilon) = g/R (bold(r) times bold(n))/(R - bold(r) dot bold(n))
//  $
//  dove $R$ usa la regolarizzazione per fare i calcoli, altrimenti servono dei campi ausiliari #footnote[https://en.wikipedia.org/wiki/Magnetic_monopole#Potential_formulation].
//
//  Ma $bold(A)$ p definito a meno di una trasformazione di gauge:
//  $
//  bold(A) -> bold(A)' = bold(A) - i/e U^dagger bold(nabla) U; space U = e^(i e lambda(bold(r)))
//  $
//  Il flusso deve essere conservato:
//  $
//  delta Phi = integral.cont d bold(ell) dot bold(nabla) lambda = 0 space ==> space lambda(phi + 2 pi) = lambda(phi)
//  $
//  Quindi la trasformazione di gauge deve essere a singolo valore
//]

// ================================================================
//                             2 / 5
// ================================================================

#slide(
  section: ([Monopoli in QM],),
)[
  #cols[
    = Quantizzazione della carica
    - Operatore momento angolare: $
      hat(D) = bold(nabla) - i e hat(bold(A))(bold(r)) overbracket(-->, "gauge") hat(U) hat(D) = e^(i e lambda(bold(r))) hat(D)
    $ per cui la lagrangiana trasforma: $
    cal(L) -> cal(L) + e dot(bold(r)) bold(nabla) lambda(bold(r)) ==> S -> S + lr(e lambda(bold(r))|)_0^T
    $ vogliamo che l'ampiezza $e^(i S)$ sia invariante di gauge: #math.equation(block: true, numbering: "(1)", $
      delta S = e delta lambda = 2 pi n ==> #rect(radius: 3pt, stroke: red)[$mu eq.def e g = n\/2$]
    $)<quantization-condition>
    - La presenza di un singolo monopolo nell'universo impone la quantizzazione della carica! @yakov
    - Un altro modo semplice è imporre la non fisicità della stringa di dirac, i.e. la fase accumulata nel path integral intorno ad essa deve essere $2 pi n$, si ritrova @quantization-condition.// (TODO forse è meglio riportare anche l'approccio eq. 2.9 dello Yakov).
    - Approccio Saha: /*la correzione al momento angolare non deve essere osservabile*/ $
    tilde(bold(L)) = bold(L) + text(#red.darken(20%), e g hat(r)) <-- #[imponendo auto [semi-]interi]
    $
  ][
    = Generalizzazione 
    - Condizione di Schwinger-Zwanzinger per una coppia di dyoni invece di una $e-g$: $
    e_1 g_2 - e_2 g_1 = n in ZZ
    $ impone la quantizzazione sia della carica elettrica che magnetica: #math.equation(numbering: "(1)", block: true, $
    e + i g = e_0 (m tau + n); space tau = theta / (2 pi) + i n_0/e_0^2
    $) <dyon-quantization>
    - La simmetria $S O(2)$ è rotta e i dyoni giaciono su di un reticolo definito da  @dyon-quantization, di cui le cariche elettriche corrispondono a $m = 0$
    #figure[
      //Da ridisegnare:
      #place(bottom + center, dy: 38mm, image("img/slide_2/image_2.png", width: 75%))
    ]
  ]
]

#script[
  Se guardiamo il problema dell'interazione tra una carica elettrica e magnetica da un punto di vista quantistico, troviamo dei vincoli aggiuntivi.\
  Infatti calcolando la variazione dell'azione, e imponendo che l'ampiezza $e^(i S)$ sia invariante di gauge, troviamo la seguente *regola di quantizzazione*.\
  Questa è particolarmente interessante perché, come fa notare Dirac, ci dice che se anche un solo monopolo magnetico esiste nell'universo, allora la carica elettrica deve essere quantizzata semplicemente per consistenza!

  Ci sono altri modi per giungere alla stessa regola di quantizzazione, uno particolarmente interessante è quello di calcolare il *Path Integral* intorno alla stringa, che abbiamo richiesto non essere osservabile, dunque la fase accumulata deve essere multipla di $2 pi$.\
  Un'altro approccio particolarmente interessante è quello di Saha, che richiede semplicemente che il momento angolare sia intero o semi-intero, e questo ci porta direttamente alla stessa conclusione.

  Ripetendo lo stesso ragionamento e considerando il problema dinamico dell'interazione tra due dyoni (ossia una coppia di cariche elettriche e magnetiche), troviamo una *più generale condizione di quantizzazione*, che impone contemporaneamente la quantizzazione sia della carica elettrica che magnetica.\  
  Scopriamo che stavolta la presenza di un dyone nell'universo impone la quantizzazione di entrambe le cariche. $e$ e $g$ sono collegate e giacciono su un reticolo bidimensionale come quello mostrato in figura.\
  Può sorgere la domanda del perché uno dei due assi è lungo $e$, ma questa è semplicemente una condizione che deriva dal fatto che sappiamo già esistere la carica elettrica equi-spaziata senza la carica magnetica, quindi nulla di particolare.

  #place(bottom + right)[$approx$ 1.5 min]
]

// ================================================================
//                             3 / 5
// ================================================================

#slide(
  section: ([Soluzione topologica dei monopoli abeliani],),
  cols[
    == Monopolo di Wu-Yang
    - Cerchiamo una soluzione non singolare
    - dobbiamo rinunciare ad avere un solo set di coordinate
    - possiamo usare ad esempio il ricoprimento: $
    cases(
      bold(A)^N = g (1 - cos theta)/(r sin theta) hat(bold(e))_phi,
      bold(A)^S = -g (1 + cos theta)/(r sin theta) hat(bold(e))_phi,
    )
    $ connessi da una gauge
    - calcolando la fase guadagnata da una funzione d'onda (a singolo valore) nella regione di sovrapposizione, si ha nuovamente la regola di quantizzazone della carica

    #figure[
      #image("img/slide_3/image_2.png", width: 37%)
    ]

    - Formalizzabile in modo naturale tramite nozioni di topologia e geometria differenziale
  ][
    === Topologia
    - Descriviamo lo spazio ed il campo come un fibrato: localmente $cal(M) = X times F$ (triviale se vale per tutto lo spazio)
    - Punto chiave: globalmente, la topologia è definita dalle funzioni di transizione /*delle mappe*/ dei ricoprimenti
    - La "forma geometrica" deve essere definita tramite la metrica e la connessione
    - Una classificazione sono le classi caratteristiche di Chern $c_k$
    - Per $c_0 = 0$ il fibrato è triviale e può essere ricoperto da una sola carta. Il pontenziale ed il tensore degli stress è definito globalmente. Questo è il caso delle equazioni di Maxwell usuali.
    - La situazione cambia se togliamo un punto: $R^3\/{0}$ è omotopo a $S^2$ e servono almeno due ricoprimenti. Infatti/conseguenza $F$ è una forma chiusa ma non esatta.
    - In questo caso la topologia è definita da $c_1 eq.def n$ (_carica topologica_), per $c_1 = 0$ siamo nel caso triviale usuale mentre $c_1 = 1$ ad esempio è descrivibile tramite il fibrato di Hopf
    === Conclusioni
    - Un monopolo abeliano può esistere se la topologia dell'universo non è triviale
  ]
)

#script[
  Un'altra soluzione molto interessante è quella proposta da Wu e Yang, che consiste nel rappresentare il potenziale vettore tramite un ricoprimento dello spazio con due potenziali di Dirac al fine di eliminare la singolarità. Questo è possibile solo rinunciando alla richiesta di avere un solo set di coordinate, e questo non è strano perché succede in altre situazioni come quando proviamo a parametrizzare $S O(3)$.

  Se ci chiediamo come che fine fa la regola di quantizzazione, scopriamo che rimane comunque, ed è particolarmente semplice da ritrovare se richiediamo che le funzioni d'onda siano a singolo valore e calcoliamo la fase guadagnata nella regione di sovrapposizione. #footnote[DA RIVEDERE!!!]

  L'approccio di Wu e Yang è particolarmente interessante perché si formalizza in modo naturale tramite nozioni di topologia e geometria differenziale.\
  Infatti in generale possiamo descrivere il "bundle" di spazio e campo come un fibrato/* ("fiber bundle")*/, qui ad esempio $X$ è lo spazio ed $F$ il campo.

  In generale la topologia non è definita solo da questo prodotto, ma dalle funzioni di transizione dei ricoprimenti.\
  In particolare se possiamo scrivere il fibrato come prodotto cartesiano, allora il fibrato è triviale e possiamo usare un solo set di coordinate. Questo corrisponde all'avere un numero di Chern $c_0 = 0$.\

  Una cosa particolare succede se togliamo un punto dello spazio (la sorgente), in tal caso la topologia è definita da $c_1 = n$, e questo corrisponde alla *carica topologica*, collegata a $mu = e g$.

  La conclusione notevole è che la presenza di un monopolo rende la topologia dell'universo non triviale!

  #place(bottom + right)[$approx$ 1.5 min]
]

// ================================================================
//                             4 / 5
// ================================================================

/*#slide(
  section: ([Monopoli abeliani], [Formulazione relativistica],),
  cols[
    - Possiamo generalizzare la costruzione riscrivendo le equazioni di maxwell e la dinamica in modo simmetrico: $
    diff_mu F^(mu nu) = j^((e) nu), space & space diff_mu tilde(F)^(mu nu) = j^((g) nu),\
    m_e (d u_mu^(e))/(d tau^(e)) = e F_(mu nu) u^((e) nu), space & space m_e (d u_mu^(g))/(d tau^(g)) = e F_(mu nu) u^((g) nu),
    $
    - la costruzione dei potenziali non è banale, dirac propone: $
    F_(mu nu) = diff_mu A_nu - diff_nu A_mu text(#red.darken(40%), - tilde(G)_(mu nu)) space, space diff^(mu) G_(mu nu) = j_nu^((g))
    $
    - questo ci induce a pensare di introdurre due potenziali: $
    cases(
      F_(mu nu) = diff_mu A_nu - diff_nu A_mu - epsilon_(mu nu rho sigma) diff_sigma tilde(A)^sigma,
      tilde(F)_(mu nu) = diff_mu tilde(A)_nu - diff_nu tilde(A)_mu + epsilon_(mu nu rho sigma) diff_sigma A^sigma,
    )
    $ con la condizione di consistenza per mantenere il numero di gradi di libertà $
    diff_mu A_nu - diff_nu A_mu + epsilon_(mu nu rho sigma) diff^sigma tilde(A)^rho = 0
    $
    - ritroviamo il caso usuale con una rotazione di $theta = -arctan(g\/e)$ (cfr @todo-simm-1): $
    D: cases(
      A_mu -> A_mu cos theta - tilde(A)_mu sin theta,
      tilde(A)_mu -> A_mu sin theta + tilde(A)_mu cos theta,
    )
    $
  ][
    = TODO
    - meccanica quantistica
    - invarianza relativistica
  ]
)*/

#slide(
  section: (/*[Monopoli abeliani], */[Formulazione relativistica],),
  {
  show math.equation: set text(11pt)
  cols[
    - Possiamo generalizzare la costruzione riscrivendo le equazioni di maxwell e la dinamica in modo simmetrico: $
    diff_mu F^(mu nu) = j^((e) nu), space & space diff_mu tilde(F)^(mu nu) = j^((g) nu)
    $ e la dinamica: $
    m_e (d u_mu^((e)))/(d tau^((e))) = e F_(mu nu) u^((e) nu), space & space m_g (d u_mu^((g)))/(d tau^((g))) = e F_(mu nu) u^((g) nu),
    $
    - la costruzione dei potenziali non è banale, dirac propone: $
    F_(mu nu) = diff_mu A_nu - diff_nu A_mu text(#red.darken(40%), - tilde(G)_(mu nu)) space, space diff^(mu) G_(mu nu) = j_nu^((g))
    $ dove $G_(mu nu)$ è un tensore aggiuntivo per soddisfare la seconda equazione.
    - esplicitando le componenti di $F_(mu nu)$ e $tilde(F)_(mu nu)$ si trovano le equazioni di maxwell con sorgente come scritte nella prima slide.
  ][
    - questo ci induce a pensare di introdurre due potenziali: $
    cases(
      F_(mu nu) = diff_mu A_nu - diff_nu A_mu - epsilon_(mu nu rho sigma) diff_sigma tilde(A)^sigma,
      tilde(F)_(mu nu) = diff_mu tilde(A)_nu - diff_nu tilde(A)_mu + epsilon_(mu nu rho sigma) diff_sigma A^sigma,
    )
    $
    - è necessaria una condizione di consistenza per mantenere il numero di gradi di libertà $
    diff_mu A_nu - diff_nu A_mu + epsilon_(mu nu rho sigma) diff^sigma tilde(A)^rho = 0
    $
    - Ritroviamo il caso usuale con una rotazione di $theta = -arctan(g\/e)$ (cfr @todo-simm-1): $
    D: cases(
      A_mu -> A_mu cos theta - tilde(A)_mu sin theta,
      tilde(A)_mu -> A_mu sin theta + tilde(A)_mu cos theta,
    )
    $
  ]
  }
)

#script[
  Un altro approccio interessante è quello di generalizzare la costruzione dei campi cercando di riscrivere la dinamica e le equazioni di Maxwell in modo simmetrico.\
  Qui le prime due equazioni sono le equazioni di Maxwell con sorgente e quelle sotto rappresentano la dinamica.\
  Questa non è una scelta fatta a caso, ma esplicitando le varie componenti si trovano le equazioni di maxwell come scritte nella prima slide.

  La costruzione dei potenziali non è banale, l'approccio proposto da Dirac è quello di scrivere il tensore di campo come derivata dei potenziali usuali e di un tensore aggiuntivo, per soddisfare la seconda equazione.

  Questo ci induce subito a pensare di introdurre due potenziali. Questi due potenziali potrebbero così descrivere i campi senza bisogno di singolarità.\
  Questo comunque non è gratis, ma avendo introdotto variabili aggiuntive ($G_(mu nu)$), siamo ora costretti a introdurre un'equazione di consistenza per mantenere il numero di gradi di libertà.

  Questo ricorda vagamente il caso della parametrizzazione del gruppo $S O(3)$ come accennato prima, infatti tutte le parametrizzazioni con 3 parametri hanno qualche singolarità#footnote[DA RIVEDERE] ed in molti casi per comodità si preferisce eliminarla al costo di introdurre un'altra variabile ed una condizione di "normalizzazione", è questo un caso d'uso dei quaternioni.\
  Analogamente tale trattazione che fa leva su due potenziali risulta particolarmente utile nelle trattazioni relativistiche.

  Notiamo infine che possiamo ritrovare il caso "normale" con una rotazione di $theta = -arctan(g\/e)$ in modo simile a quanto fatto nella prima slide.

  //Una generalizzazione interessante è quella di riscrivere le equazioni di Maxwell e la dinamica in modo simmetrico, introducendo due set di equazioni per i campi e le correnti elettriche e magnetiche.\
  //La costruzione dei potenziali non è banale, e Dirac propone una soluzione che introduce due potenziali, e questo ci induce a pensare di introdurre due potenziali.\
  //La condizione di consistenza per mantenere il numero di gradi di libertà è data da una relazione tra i due potenziali, e ritroviamo il caso usuale con una rotazione di $theta = -arctan(g\/e)$.

  #place(bottom + right)[$approx$ 1.5 min]
]

// ================================================================
//                             5 / 5
// ================================================================

/*#slide(
  section: ([Ricerche sperimentali],),
  cols[
    - TODO Cercare un po' in rete, ad esempio:
      - HECOs https://atlas.cern/Updates/Physics-Briefing/Run2-Monopoles
      - HECOs https://home.cern/news/news/physics/quest-curious-magnetic-monopole-continues
      - MoEDAL https://www.home.cern/news/news/physics/moedal-zeroes-magnetic-monopoles
      - MoEDAL https://arxiv.org/pdf/1604.06645 (vedi https://home.infn.it/it/comunicati-stampa-full/comunicati-stampa-2016/1951-ricerca-dei-monopoli-magnetici-l-esperimento-moedal-pubblica-i-primi-risultati-2) !!!
      - https://arxiv.org/abs/1905.10130
      - https://arxiv.org/abs/1905.10130
      - https://iopscience.iop.org/article/10.1088/1742-6596/2375/1/012002/pdf

    - Altri link da vedere:
      - https://atlas.cern/Updates/Physics-Briefing/Run2-Monopoles

  ][
    #text(gray)[cercando "yakov m. shmir monopoles"]: #link("https://cds.cern.ch/record/2744867/files/CERN%20THESES%202020%20191.pdf", text(red)[QUESTA TESI])
  ]
)*/

#slide(
  section: ([Ricerche sperimentali],),
  cols[
    == Proprietà ricercate
    - Alcune teorie "Beyond the Standard Model" (BSM) prevedono l'esistenza di monopoli magnetici @tesi-mai
    - I monopoli avrebbero un forte coupling elettromagnetico e sono previste dalle teorie sotto forma di HIPs ("Highly Ionizing Particles"),
    - I monopoli sono inquadrati in alcune "Grand Unified Theories" (GUTs), la cui scala di energia aspettata è tra la scala elettrodebole ($~10^2 space G e V$) e la scala di Planck ($~10^19 space G e V$)

    == Alcuni esperimenti
    - La ricerca di osservazioni dirette di tali particelle si concentra chiaramente sulle "Long Lived Particles"
    - Alcuni esperimenti sono sfruttano i raggi cosmici per esplorare le energie più alte
    - Una possibilità e quella di misurare direttamente i campi magnetici tramite anelli superconduttori oppure SQUIDs (Superconducting Quantum Interference Devices @squid)
  ][
    - Ricerca tramite rivelatori Cherenkov (AMANDA) guardano particolari segnature dovute alla alta massa prevista dalle GUTs @tesi-mai ed all'alta energia persa per ionizzazione, considerando anche il filtraggio dovuto al campo magnetico terrestre @MACRO-giacomelli
    //- TODO esperimento #link("https://arxiv.org/pdf/0707.1691")[MACRO] che devo ancora capire
    - L'esperimento ANITA cerca invece segnali radio dovuti all'interazione con il ghiaccio Antartico di monopoli ultra-relativistici

    === Ricerca nei collisori
    - L'LHC è il candidato più adatto poiché la scala di energia potrebbe essere elevata ma alcune teorie suggeriscono tali particelle anche ad energie $~T e V$ @tesi-mai
    - Essendo HIPs, la ricerca di un'osservazione diretta di LLPs è possibile cercando delle tracce molto strette sui calorimetri elettromagnetici (ECAL), con la condizione che la traccia nei calorimetri adronici (HCAL) sia piccola o nulla
    - essendo HIPs è possibile ricercare particolari traiettorie nei campi magnetici
  ]
)

// ================================================================
//                        RINGRAZIAMENTI
// ================================================================

#raw-slide(
  counter-name: "intro-slides",
  counter-display: "I",
)[
  = Ringraziamenti
  #text(size: 1.25em)[Un sentito ringraziamento al Prof. Stefano Bolognesi per la sua preziosa guida, agli amici per il loro sostegno e alla mia famiglia per il loro infinito supporto.]

  #place(bottom, dy: -10pt, align(top, bibliography("bibliography.yaml")))
]

//ciao