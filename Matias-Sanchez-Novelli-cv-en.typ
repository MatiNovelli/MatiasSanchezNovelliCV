#let accent-color = rgb("#2b4c7e")
#let light-accent = rgb("#e8eef5")
#let dark-text = rgb("#2c2c2c")
#let medium-text = rgb("#555555")

// Placeholder for data to fill in before sending (highlighted in red)
#let todo(body) = text(fill: rgb("#c0392b"), weight: "bold")[#body]

#set page(
  paper: "us-letter",
  margin: (x: 1.25cm, y: 0.75cm),
)

// hyphenate: false prevents Typst from inserting soft hyphens (U+00AD) that
// break keywords when an ATS extracts the text.
#set text(
  font: "New Computer Modern",
  size: 9pt,
  lang: "en",
  fill: dark-text,
  hyphenate: false,
)

// Words with hyphens (end-to-end, full-time, x86-64) are never broken across
// lines: the split leaves "end-to-" / "end" in the extracted text.
#show regex("\w+(?:-\w+)+"): box

#set par(leading: 0.48em, spacing: 0.6em)

// Compact lists: the default gap between bullets wastes half a page
#set list(spacing: 0.6em, indent: 5pt, body-indent: 4pt)

// Global link styling
#show link: it => text(fill: accent-color)[#underline(it)]

// --- Layout Helper Functions ---

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

// Skills row: bold category + technology list
#let skill-row(category, items) = {
  grid(
    columns: (3.6cm, 1fr),
    column-gutter: 6pt,
    text(size: 8.8pt, weight: "bold", fill: accent-color)[#category],
    text(size: 8.8pt)[#items],
  )
  v(0.5pt)
}

// --- Document Start ---

// Header + Contact (single text line: no grid or box, safer for ATS)
#align(center)[
  #text(size: 19pt, weight: "bold", tracking: 0.8pt, fill: accent-color)[MATÍAS SÁNCHEZ NOVELLI]
  #v(3pt)
  #text(size: 9pt, fill: medium-text)[Computer Engineering Student · Software Engineer Intern · Villa Ballester, Buenos Aires, Argentina]
  #v(2pt)
  #text(size: 8.8pt)[
    +54 9 11 5909 5532 · msancheznovelli\@itba.edu.ar ·
    #link("https://www.linkedin.com/in/matias-sanchez-novelli-765b851ab/")[linkedin.com/in/matias-sanchez-novelli-765b851ab] ·
    #link("https://github.com/MatiNovelli")[github.com/MatiNovelli]
  ]
]

// PROFILE Section
#section-title("Profile")
#par(justify: true)[
  #text(size: 8.8pt)[Third-year *Computer Engineering* student at *ITBA* (expected graduation *Dec 2028*). Built for a real client a *WhatsApp sales agent* on an *LLM* backed by *219 tests*; led an *e-commerce* platform with integrated payments in *Next.js* and *PostgreSQL*; and implemented an *x86-64 kernel* from scratch in *C* and *Assembly*. Co-lead *Computer Society ITBA* and trained *100+ students* for *QuantumJam*, Argentina's first *quantum programming* competition, backed by *IBM*. Available *full-time* or *part-time*.]
]

// TECHNICAL SKILLS Section
#section-title("Technical Skills")

#skill-row("Programming:", [*Java*, *C*, *Python*, *TypeScript*, *JavaScript*, *SQL*, *Kotlin*, *Assembly x86-64*])
#skill-row("Fundamentals:", [*Data structures & algorithms*, *OOP*, *unit & integration testing*])
#skill-row("Backend:", [*Spring MVC*, *Spring Security*, *FastAPI*, *REST APIs*, *Webhooks*])
#skill-row("Data:", [*PostgreSQL*, *Spring JDBC*, *Flyway*, *SQLAlchemy*, *Prisma*])
#skill-row("Frontend & Mobile:", [*React*, *Next.js*, *Tailwind CSS*, *JSP*, *Android (Jetpack Compose)*])
#skill-row("Tools:", [*Git*, *GitHub*, *Docker*, *Maven*, *Linux/Unix*, *JUnit*, *Mockito*, *pytest*, *GDB*, *QEMU*])
#skill-row("Applied AI:", [*Claude API (Anthropic)*, *Gemini API*, *LLMs* with *guardrails*, *automated evaluation*])
#skill-row("Languages:", [*Spanish* (native) · *English B2* (upper-intermediate)])

// EDUCATION Section
#section-title("Education")

#cv-item(
  "Instituto Tecnológico de Buenos Aires (ITBA)",
  "Mar 2024 — Dec 2028",
  "Computer Engineering",
  none,
  [Completed coursework: *Imperative Programming* (*C*), *Object-Oriented Programming* (*Java*), *Databases* (*SQL*), *Operating Systems*, *Computer Architecture*, *Software Engineering*, *Discrete Mathematics*.],
)

// EXPERIENCE Section
#section-title("Experience")

#cv-item(
  "Software Developer (Freelance)",
  "Aug 2026 — Present",
  "Modo Ruta — Hotel Management Company",
  "Buenos Aires, Argentina",
  [
    - *Built end-to-end a conversational WhatsApp sales agent* on the *Claude API* for a hotel management company receiving *\~250 daily inquiries*, in *Python 3.12 async*, *FastAPI*, *PostgreSQL*, and *SQLAlchemy*.
    - *Eliminated the risk of fabricated prices* by confining the *LLM* to interpreting and drafting while a deterministic search engine computes price and availability, with an *automated audit* validating every quoted figure against persisted evidence.
    - *Designed the unit and integration test suite* (*219 tests*, *pytest*), from isolated business rules to the *end-to-end* flow from webhook to persisted quote, and decoupled the *Octorate* booking engine *REST API* behind a swappable interface.
  ],
)

#cv-item(
  "Co-Director (formerly Head of Mentors & Workshops)",
  "Apr 2025 — Present",
  "Computer Society ITBA",
  "Buenos Aires, Argentina",
  [
    - *Promoted after 16 months leading mentors and workshops*; now setting the technical agenda for a 25-member organization.
    - *Trained 100+ students* in the *BB84* *quantum key distribution* protocol by designing the curriculum and technical workshops for *QuantumJam*, Argentina's first *quantum programming* competition, backed by *IBM*.
    - *Coordinated the mentor and judge team at hackITBA*, ITBA's largest hackathon (*200+ participants*).
  ],
)

#cv-item(
  "Programming Tutor",
  "Jan 2025 — Present",
  "Self-employed",
  "Buenos Aires, Argentina",
  [
    - *Prepared ITBA Engineering students to pass Imperative Programming and Object-Oriented Programming*, teaching *manual memory management*, *pointers*, and *GDB* debugging in *C*, plus *inheritance*, *polymorphism*, and *algorithmic complexity analysis* in *Java*.
  ],
)

// PROJECTS Section
#section-title("Projects")

#cv-item(
  "kpopbay — Buy, Sell & Trade Marketplace",
  "2026",
  "Java 21, Spring MVC, Spring Security, Spring JDBC, PostgreSQL, Flyway, JSP",
  link("http://pawserver.it.itba.edu.ar/paw-2026b-09/")[pawserver.it.itba.edu.ar/paw-2026b-09],
  [
    - *Built a deployed web marketplace in a team of 4* with a layered, multi-module *Maven* architecture: implemented *moderation* (reports, content takedown, and user suspension) and email *password reset* with atomically consumed one-time links, with service and DAO tests in *JUnit* and *Mockito*.
  ],
)

#cv-item(
  "GroupBuy — Group Buying Platform",
  "2026",
  "Next.js, TypeScript, PostgreSQL, Prisma",
  link("https://github.com/MatiNovelli/GroupBuy")[github.com/MatiNovelli/GroupBuy],
  [
    - *Led development in a team of 5*: a campaign *state machine* with volume-based decreasing pricing on *PostgreSQL* and *Prisma*, plus *MercadoPago Checkout Pro* payments with *HMAC* webhook signature verification.
  ],
)

#cv-item(
  "Bare-Metal x86-64 Kernel",
  "2026",
  "C, Assembly, Docker, QEMU",
  link("https://github.com/MatiNovelli/so-tp2")[github.com/MatiNovelli/so-tp2],
  [
    - *Implemented a kernel that boots with no underlying operating system* (team project of 8): a 5-level priority *scheduler*, *syscalls*, *semaphores*, *pipes*, an interactive shell, and two interchangeable *memory managers* (*First-Fit* and *Buddy System*).
  ],
)