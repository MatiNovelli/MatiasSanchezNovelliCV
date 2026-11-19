// Master CV (ENGLISH) - Matias Sanchez Novelli
// Visual style based on documents/cv/Matias-Sanchez-Novelli-cv.typ
// Compile with: typst compile cv/cv_en.typ

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
  lang: "en",
  fill: dark-text,
  hyphenate: false,
)

// Las palabras con guion (end-to-end, full-time, x86-64) nunca se cortan entre
// lineas: con lang "es" Typst repite el guion al inicio de la linea siguiente
// y el ATS extrae "end-to--end".
#show regex("\w+(?:-\w+)+"): box

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
  #text(size: 19pt, weight: "bold", tracking: 0.8pt, fill: accent-color)[MATIAS SANCHEZ NOVELLI]
  #v(3pt)
  #text(size: 9pt, fill: medium-text)[Computer Engineering Student · Software Developer · Villa Ballester, Buenos Aires, Argentina]
  #v(2pt)
  #text(size: 8.8pt)[
    +54 9 11 5909 5532 · msancheznovelli\@gmail.com ·
    #link("https://www.linkedin.com/in/matias-sanchez-novelli-765b851ab/")[linkedin.com/in/matias-sanchez-novelli-765b851ab] ·
    #link("https://github.com/MatiNovelli")[github.com/MatiNovelli]
  ]
]

// PROFILE
#section-title("Profile")
#par(justify: true)[
  #text(size: 8.8pt)[*Third-year Computer Engineering* student at *ITBA* (expected graduation *Dec 2028*) focused on *applied artificial intelligence* and *backend* development. Built *end-to-end* a *WhatsApp sales agent* on the *Claude API* for a real client receiving *\~250 daily inquiries*. Co-Director of *Computer Society ITBA*, where I trained *100+ students* for Argentina's first *quantum programming* competition. Available for *internship*, *trainee* or *part-time Junior* roles.]
]

// TECHNICAL SKILLS
#section-title("Technical Skills")

#skill-row("Applied AI:", [*Claude API (Anthropic)*, *Gemini API*, *LLM* agents with *tool use* and *guardrails*, *Claude Code*])
#skill-row("Backend:", [*Python 3.12* (*FastAPI*), *Java 21* (*Spring MVC*, *Spring Security*, *Spring JDBC*), *REST APIs*, *Webhooks*])
#skill-row("Data:", [*PostgreSQL*, *SQLite*, *SQL*, *SQLAlchemy*, *JPA/Hibernate*, *Flyway*, *Prisma*])
#skill-row("Testing:", [*unit and integration testing* with *pytest*, *JUnit* and *Mockito*])
#skill-row("Frontend & Mobile:", [*TypeScript*, *JavaScript*, *React*, *Next.js*, *Tailwind CSS*, *JSP*, *Android* (*Kotlin*, *Jetpack Compose*)])
#skill-row("Systems & Tools:", [*C*, *Assembly x86-64*, *Linux/Unix*, *Git*, *GitHub*, *Docker*, *Maven*, *GDB*, *QEMU*])
#skill-row("Languages:", [*Spanish* (native) · *English B2* (upper-intermediate)])

// EDUCATION
#section-title("Education")

#cv-item(
  "Instituto Tecnológico de Buenos Aires (ITBA)",
  "Mar 2024 — Dec 2028",
  "Computer Engineering (Ingeniería Informática), in progress",
  "Buenos Aires",
  [Courses passed: *Imperative Programming* (*C*), *Object-Oriented Programming* (*Java*), *Databases* (*SQL*), *Operating Systems*, *Computer Architecture*, *Software Engineering*, *Discrete Mathematics*.],
)

// EXPERIENCE
#section-title("Experience")

#cv-item(
  "Software Developer (Freelance)",
  "Aug 2026 — Present",
  "Modo Ruta — Hotel Management Company",
  "Buenos Aires",
  [
    - *Built end-to-end a conversational WhatsApp sales agent* on the *Claude API* for a hotel management company receiving *\~250 inquiries per day*, using *Python 3.12 async*, *FastAPI*, *SQLite* and *Docker Compose*.
    - *Kept the LLM out of price calculation*: the model interprets and drafts via *tool use*, while price and availability come only from the *Octorate* booking engine's *REST API*, with every search validated in code and a swappable LLM (*Claude*, *Gemini*, *OpenAI*).
    - *Implemented the handoff to human sales staff* (booking requests, unanswered questions or technical errors), *HMAC* webhook signature verification and automatic *OAuth* token renewal for Octorate, tested with *pytest* and built spec-driven with *Claude Code*.
  ],
)

#cv-item(
  "Co-Director (previously Head of Mentors & Workshops)",
  "Aug 2025 — Present",
  "Computer Society ITBA",
  "Buenos Aires",
  [
    - *Promoted after 12 months leading mentors and workshops*; set the technical agenda of a 25-member organization.
    - *Trained 100+ students* on the *BB84* *quantum key distribution* protocol, designing the syllabus and technical workshops for *QuantumJam*, Argentina's first *quantum programming* competition, backed by *IBM*.
    - *Coordinated the mentor and judging team for hackITBA*, ITBA's largest hackathon (*200+ participants*).
  ],
)

#cv-item(
  "Private Programming Tutor",
  "Jan 2025 — Present",
  "Independent",
  "Buenos Aires",
  [
    - *Prepare ITBA students for Imperative Programming and OOP*: *manual memory management*, *pointers* and debugging with *GDB* in *C*; *inheritance*, *polymorphism* and *algorithmic complexity* in *Java*.
  ],
)

// PROJECTS
#section-title("Projects")

#cv-item(
  "kpopbay — Buy, Sell and Trade Marketplace",
  "2026",
  "Java 21, Spring MVC, Spring Security, JPA/Hibernate, PostgreSQL, Flyway, JSP, Maven",
  link("http://pawserver.it.itba.edu.ar/paw-2026b-09/")[pawserver.it.itba.edu.ar/paw-2026b-09],
  [
    - *Developed in a team of 4 a deployed web marketplace* with a layered architecture in multi-module *Maven*: implemented *moderation* (reports, content takedown, user suspension) and email *password reset* with single-use links, with service and DAO tests in *JUnit* and *Mockito*.
  ],
)

#cv-item(
  "GroupBuy — Group Purchasing Platform",
  "2026",
  "Next.js, TypeScript, PostgreSQL, Prisma, MercadoPago",
  link("https://github.com/MatiNovelli/GroupBuy")[github.com/MatiNovelli/GroupBuy],
  [
    - *Led development in a team of 5*: campaign *state machine* with volume-based decreasing prices on *PostgreSQL* and *Prisma*, and *MercadoPago Checkout Pro* payments verifying the webhook's *HMAC* signature.
  ],
)

#cv-item(
  "Bare-Metal x86-64 Kernel",
  "2026",
  "C, Assembly x86-64, Docker, QEMU, GDB",
  link("https://github.com/MatiNovelli/so-tp2")[github.com/MatiNovelli/so-tp2],
  [
    - *Implemented a kernel that boots with no underlying operating system* (team of 8): 5-level priority *scheduler*, *syscalls*, *semaphores*, *pipes*, an interactive shell and two swappable *memory managers* (*First-Fit* and *Buddy System*).
  ],
)
