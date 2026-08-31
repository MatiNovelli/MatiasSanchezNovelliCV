#let accent-color = rgb("#2b4c7e")
#let light-accent = rgb("#e8eef5")
#let dark-text = rgb("#2c2c2c")
#let medium-text = rgb("#555555")

// Marcador para datos a completar antes de enviar (resaltado en rojo)
#let todo(body) = text(fill: rgb("#c0392b"), weight: "bold")[#body]

#set page(
  paper: "us-letter",
  margin: (x: 1.25cm, y: 0.75cm),
)

// hyphenate: false evita que Typst inserte guiones suaves (U+00AD) que
// rompen las palabras clave al extraer el texto en un ATS.
#set text(
  font: "New Computer Modern",
  size: 9pt,
  lang: "es",
  fill: dark-text,
  hyphenate: false,
)

#set par(leading: 0.48em, spacing: 0.6em)

// Listas compactas: la separacion por defecto entre bullets desperdicia media pagina
#set list(spacing: 0.6em, indent: 5pt, body-indent: 4pt)

// Estilo global de links
#show link: it => text(fill: accent-color)[#underline(it)]

// --- Funciones de Ayuda para el Diseño ---

#let section-title(title) = {
  v(5pt)
  grid(
    columns: (auto, 1fr),
    column-gutter: 8pt,
    align(horizon)[
      #text(weight: "bold", fill: accent-color, size: 10.5pt, tracking: 0.4pt)[#upper(title)]
    ],
    align(horizon)[
      #line(length: 100%, stroke: 1pt + accent-color)
    ],
  )
  v(2pt)
}

#let date-pill(date) = {
  box(
    fill: light-accent,
    inset: (x: 6pt, y: 3pt),
    radius: 3pt,
    text(size: 8.5pt, fill: accent-color, weight: "medium")[#date]
  )
}

#let cv-item(role, date, place, location, description) = {
  grid(
    columns: (1fr, auto),
    align(horizon)[
      #text(weight: "bold", size: 9.5pt)[#role]
    ],
    align(right + horizon)[#date-pill(date)],
  )
  if place != none or location != none {
    v(1pt)
    grid(
      columns: (1fr, auto),
      if place != none { text(style: "italic", fill: medium-text)[#place] },
      if location != none { align(right)[#text(fill: medium-text)[#location]] },
    )
  }
  if description != none {
    v(2pt)
    set par(justify: true, leading: 0.48em)
    text(size: 8.8pt)[#description]
  }
  v(6pt, weak: true)
}

// Fila de habilidades: categoría en negrita + lista de tecnologías
#let skill-row(category, items) = {
  grid(
    columns: (3.6cm, 1fr),
    column-gutter: 6pt,
    text(size: 8.8pt, weight: "bold", fill: accent-color)[#category],
    text(size: 8.8pt)[#items],
  )
  v(0.5pt)
}

// --- Inicio del Documento ---

// Encabezado + Contacto (una sola linea de texto: sin grid ni box, mas seguro para ATS)
#align(center)[
  #text(size: 19pt, weight: "bold", tracking: 0.8pt, fill: accent-color)[MATÍAS SÁNCHEZ NOVELLI]
  #v(3pt)
  #text(size: 9pt, fill: medium-text)[Estudiante de Ingeniería Informática · Villa Ballester, Buenos Aires, Argentina]
  #v(2pt)
  #text(size: 8.8pt)[
    +54 9 11 5909 5532 · msancheznovelli\@itba.edu.ar ·
    #link("https://www.linkedin.com/in/matias-sanchez-novelli-765b851ab/")[linkedin.com/in/matias-sanchez-novelli] ·
    #link("https://github.com/MatiNovelli")[github.com/MatiNovelli]
  ]
]

// Sección PERFIL
#section-title("Perfil")
#par(justify: true)[
  #text(size: 8.8pt)[Estudiante de *tercer año de Ingeniería Informática* en *ITBA* (graduación esperada *Dic 2028*). Entregué a un cliente real un *agente de ventas por WhatsApp* sobre *LLM* con *219 tests*; lideré una plataforma de *e-commerce* con pagos en *Next.js* y *PostgreSQL*; e implementé un *kernel x86-64* en *C* y *Assembly*. Capacité a *300+ estudiantes*, incluyendo la primera competencia de *programación cuántica* de Argentina junto a *IBM*.]
]

// Sección HABILIDADES TÉCNICAS
#section-title("Habilidades Técnicas")

#skill-row("Lenguajes:", [*Java*, *C*, *Python*, *TypeScript*, *SQL*, *Kotlin*, *Assembly x86-64*])
#skill-row("Backend y Datos:", [*PostgreSQL*, *FastAPI*, *SQLAlchemy*, *Prisma*, *APIs REST*, *normalización*])
#skill-row("Frontend:", [*React*, *Next.js*, *Tailwind CSS*, *JavaFX*])
#skill-row("Herramientas:", [*Git*, *GitHub*, *Docker*, *Linux/Unix*, *pytest*, *GDB*, *QEMU*])
#skill-row("IA Aplicada:", [*API de Claude (Anthropic)*, *LLMs* con *guardrails*, *evaluación automatizada*])
#skill-row("Idiomas:", [*Español* (nativo) · *Inglés B2* (intermedio-avanzado)])

// Sección EDUCACIÓN
#section-title("Educación")

#cv-item(
  "Instituto Tecnológico de Buenos Aires (ITBA)",
  "Mar 2024 — Dic 2028",
  "Ingeniería Informática",
  none,
  [Materias aprobadas: *Programación Imperativa* (*C*), *Programación Orientada a Objetos* (*Java*), *Bases de Datos* (*SQL*), *Sistemas Operativos*, *Arquitectura de Computadoras*, *Ingeniería de Software*, *Matemática Discreta*.],
)

// Sección EXPERIENCIA LABORAL
#section-title("Experiencia")

#cv-item(
  "Desarrollador de Software (Freelance)",
  "Ago 2026",
  "Modo Ruta — Gerenciadora Hotelera",
  "Buenos Aires",
  [
    - *Construí end-to-end un agente de ventas conversacional por WhatsApp* sobre la *API de Claude* para una gerenciadora hotelera que recibe *\~250 consultas diarias*, en *Python 3.12 async*, *FastAPI*, *PostgreSQL* y *SQLAlchemy*.
    - *Eliminé el riesgo de precios inventados* confinando al *LLM* a interpretar y redactar mientras un buscador determinístico calcula precio y disponibilidad, con *auditoría automática* que valida cada cifra emitida contra evidencia persistida.
    - *Escribí 219 tests* (*pytest*), de reglas de negocio aisladas al flujo *end-to-end* de webhook a cotización, e integré la *API REST* del motor de reservas *Octorate* tras una interfaz intercambiable.
  ],
)

#cv-item(
  "Co-Director",
  "Ago 2026 — Presente",
  "Computer Society ITBA",
  "Buenos Aires",
  [
    - *Dirijo la organización junto a un segundo Co-Director* tras ser promovido desde *Head of Mentors & Workshops* (Abr 2025 — Ago 2026), definiendo la agenda técnica del año.
    - *Capacité a 100+ estudiantes* en el protocolo *BB84* de *distribución cuántica de claves*, diseñando el temario y los workshops técnicos de *QuantumJam*, la primera competencia de *programación cuántica* de Argentina, con el respaldo de *IBM*.
    - *Coordiné al equipo de mentores y jurados de hackITBA*, el hackathon más grande del ITBA (*200+ participantes*).
  ],
)

#cv-item(
  "Profesor Particular de Programación",
  "Ene 2025 — Presente",
  "Independiente",
  "Buenos Aires",
  [
    - *Preparé a estudiantes de Ingeniería del ITBA para aprobar Programación Imperativa y Programación Orientada a Objetos*, enseñando *gestión manual de memoria*, *punteros* y depuración con *GDB* en *C*, y *herencia*, *polimorfismo* y *análisis de complejidad algorítmica* en *Java*.
  ],
)

// Sección PROYECTOS
#section-title("Proyectos")

#cv-item(
  "GroupBuy — Plataforma de Compras Grupales",
  "2026",
  "Next.js, TypeScript, PostgreSQL, Prisma",
  link("https://github.com/MatiNovelli/GroupBuy")[github.com/MatiNovelli/GroupBuy],
  [
    - *Lideré el desarrollo en un equipo de 5*: *máquina de estados* de campañas con precios decrecientes por volumen sobre *PostgreSQL* y *Prisma*, y pagos con *MercadoPago Checkout Pro* verificando la firma *HMAC* del webhook.
  ],
)

#cv-item(
  "Kernel x86-64 Bare-Metal",
  "2026",
  "C, Assembly, Docker, QEMU",
  link("https://github.com/MatiNovelli/so-tp2")[github.com/MatiNovelli/so-tp2],
  [
    - *Implementé un kernel que arranca sin sistema operativo subyacente* (proyecto en equipo de 8): *scheduler* con 5 niveles de prioridad, *syscalls*, *semáforos*, *pipes*, shell interactiva y dos *memory managers* intercambiables (*First-Fit* y *Buddy System*).
  ],
)

#cv-item(
  "Beto — Asistente Android con IA",
  "2026",
  "Kotlin, Jetpack Compose, Gemini",
  link("https://github.com/MatiNovelli/Beto")[github.com/MatiNovelli/Beto],
  [
    - *Construí en Platanus Hack 26 un asistente por voz para adultos mayores* que ejecuta acciones en el celular vía *AccessibilityService*, con arquitectura orientada a eventos y *128 tests*.
  ],
)
