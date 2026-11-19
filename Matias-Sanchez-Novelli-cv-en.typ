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
  #text(size: 8.8pt)[*Fourth-year Computer Engineering* student at *ITBA* (expected graduation *Dec 2028*) and *full-stack* developer focused on *applied AI*. Built and *shipped to production* an *AI sales agent for WhatsApp* on the *Claude API* and *cut its per-call model cost by 48%*. Co-Director of *Computer Society ITBA*. Available for *internship*, *trainee* or *part-time Junior* roles.]
]

// TECHNICAL SKILLS
#section-title("Technical Skills")

#skill-row("Applied AI:", [*Claude API*, *tool use / function calling*, *prompt engineering*, *prompt caching*, *Claude Code*])
#skill-row("Backend:", [*Python 3.12* (*FastAPI*), *Java 21* (*Spring MVC*, *Spring Security*), *REST APIs*, *Webhooks*])
#skill-row("Data:", [*PostgreSQL*, *SQLite*, *SQL*, *JPA/Hibernate*, *Flyway*])
#skill-row("Testing:", [*pytest*, *JUnit*, *Mockito*, *unit testing*, *integration testing*])
#skill-row("Frontend & Mobile:", [*TypeScript*, *JavaScript*, *React*, *Tailwind CSS*])
#skill-row("Systems & Tools:", [*C*, *Assembly x86-64*, *Linux/Unix*, *Git*, *GitHub*, *Docker*, *Maven*, *GDB*, *QEMU*])
#skill-row("Languages:", [*Spanish* (native) · *English B2* (upper-intermediate)])

// EDUCATION
#section-title("Education")

#cv-item(
  "Instituto Tecnológico de Buenos Aires (ITBA)",
  "Mar 2024 — Dec 2028",
  "Computer Engineering (Ingeniería Informática), in progress",
  "Buenos Aires",
  [Courses passed: *Imperative Programming* (*C*), *Object-Oriented Programming* (*Java*), *Databases* (*SQL*), *Operating Systems*, *Computer Architecture*, *Software Engineering*, *Data Structures and Algorithms*, *Web Application Project (PAW)*, *Communication Protocols*.],
)

// EXPERIENCE
#section-title("Experience")

#cv-item(
  "Software Developer (Freelance)",
  "Oct 2026 — Present",
  "Modo Ruta — Vacation Rentals",
  "Buenos Aires",
  [
    - *Built and shipped to production an AI sales agent for WhatsApp* (*Python*, *FastAPI*, *Claude API*, *tool use*) for a company with *95 rental units* and *\~250 daily inquiries* in peak season, quoting in real time from the *Octorate* PMS.
    - *Built a web dashboard for sales staff* (*React 19*, *TypeScript*, *Tailwind CSS*, *TanStack Query*) to take over and return chats to the bot, with roles, quick replies and editing of the bot's instructions without code changes.
    - *Cut per-call model cost by 48%* with *prompt caching* (81% cache hit rate in production), after measuring that 82% of spend was uncached input, and trimmed tool results and redundant calls.
    - *Kept the LLM out of price calculation* by validating every tool call in code, with a swappable LLM (*Claude*, *Gemini*, *OpenAI*), *HMAC*-signed webhooks, *pytest* tests and deployment with *Docker Compose* and *Cloudflare Tunnel*.
  ],
)

#cv-item(
  "Co-Director (previously Head of Mentors & Workshops)",
  "Aug 2025 — Present",
  "Computer Society ITBA",
  "Buenos Aires",
  [
    - *Promoted to Co-Director after 12 months* leading mentors and workshops in a *25-member* organization.
    - Organized *QuantumJam*, Argentina's first *quantum programming* competition, backed by *IBM*.
    - *Coordinated the mentor and judging team for hackITBA* (*200+ participants*).
  ],
)

#cv-item(
  "Private Programming Tutor",
  "Jan 2025 — Present",
  "Independent",
  "Buenos Aires",
  [
    - *Prepare ITBA students for Imperative Programming and OOP*: *manual memory management*, *pointers* and debugging with *GDB* in *C*; *inheritance*, *polymorphism* and *data structures* in *Java*.
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
    - *Developed in a team of 4 a deployed web marketplace* with a layered architecture (multi-module *Maven*).
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
    - *Implemented a kernel that boots with no underlying operating system*: 5-level priority *scheduler*, *syscalls*, *semaphores*, *pipes*, an interactive shell and two swappable *memory managers* (*First-Fit* and *Buddy System*).
  ],
)
