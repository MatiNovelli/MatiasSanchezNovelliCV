// CV adaptado (ESPAÑOL) - Matias Sanchez Novelli
// Postulación: Pasante de Desarrollo Backend e IA, Carrefour Argentina (LinkedIn 4486443295)
// Derivado de Matias-Sanchez-Novelli-cv.typ (CV maestro)
// Compilar con: typst compile Matias-Sanchez-Novelli-cv-carrefour.typ

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
  #text(size: 9pt, fill: medium-text)[Estudiante de Ingeniería Informática · Desarrollador Backend e IA · Villa Ballester, Buenos Aires, Argentina]
  #v(2pt)
  #text(size: 8.8pt)[
    +54 9 11 5909 5532 · msancheznovelli\@gmail.com ·
    #link("https://www.linkedin.com/in/matias-sanchez-novelli-765b851ab/")[linkedin.com/in/matias-sanchez-novelli-765b851ab] ·
    #link("https://github.com/MatiNovelli")[github.com/MatiNovelli]
  ]
]

// Sección PERFIL
#section-title("Perfil")
#par(justify: true)[
  #text(size: 8.8pt)[Estudiante de *tercer año de Ingeniería Informática* en *ITBA* (graduación esperada *dic 2028*) enfocado en *desarrollo backend en Python* e *inteligencia artificial aplicada*. Desarrollé *de punta a punta* un *agente de ventas por WhatsApp* sobre la *API de Claude* para una gerenciadora hotelera que recibe *\~250 consultas diarias*, integrando *APIs REST* de terceros. Trabajo a diario con *asistentes de código* (*Claude Code*) y valido lo que generan con *tests* y revisión antes de integrarlo. Disponible para *pasantía part-time* en modalidad *híbrida*.]
]

// Sección HABILIDADES TÉCNICAS
#section-title("Habilidades Técnicas")

#skill-row("IA Aplicada:", [*API de Claude*, *API de Gemini*, *agentes LLM* (*tool use*, *guardrails*), *MCP*, *Claude Code*])
#skill-row("Backend:", [*Python 3.12* (*FastAPI*, *asyncio*), *APIs REST*, *Webhooks*, *OAuth 2.0*, *HMAC*, *Java 21* (*Spring*)])
#skill-row("Bases de Datos:", [*SQL*, *PostgreSQL*, *SQLite*, *SQLAlchemy*, *Flyway*, *Prisma*])
#skill-row("Testing:", [*testing unitario, de integración y de regresión* con *pytest*, *JUnit* y *Mockito*])
#skill-row("Herramientas:", [*Git*, *GitHub*, *Docker*, *Docker Compose*, *Linux/Unix*, *Maven*])
#skill-row("Otros lenguajes:", [*TypeScript*, *JavaScript*, *Next.js*, *React*, *C*, *Kotlin*])
#skill-row("Idiomas:", [*Español* (nativo) · *Inglés B2* (intermedio-avanzado)])

// Sección EDUCACIÓN
#section-title("Educación")

#cv-item(
  "Instituto Tecnológico de Buenos Aires (ITBA)",
  "Mar 2024 — Dic 2028",
  "Ingeniería Informática (en curso)",
  "Buenos Aires",
  [Materias aprobadas: *Programación Imperativa* (*C*), *Programación Orientada a Objetos* (*Java*), *Bases de Datos* (*SQL*), *Sistemas Operativos*, *Arquitectura de Computadoras*, *Ingeniería de Software*, *Matemática Discreta*.],
)

// Sección EXPERIENCIA
#section-title("Experiencia")

#cv-item(
  "Desarrollador de Software (Freelance)",
  "Ago 2026 — Presente",
  "Modo Ruta — Gerenciadora Hotelera",
  "Buenos Aires",
  [
    - *Construí de punta a punta un agente de ventas conversacional por WhatsApp* sobre la *API de Claude* para una gerenciadora hotelera que recibe *\~250 consultas diarias*: relevé requerimientos con el cliente, diseñé la arquitectura y lo implementé en *Python 3.12 async*, *FastAPI*, *SQLite* y *Docker Compose*.
    - *Aislé al LLM del cálculo de precios para evitar alucinaciones*: el modelo interpreta y redacta con *tool use*, y precio y disponibilidad salen solo de la *API REST* del motor de reservas *Octorate*, con cada búsqueda validada en código y un LLM intercambiable (*Claude*, *Gemini*, *OpenAI*).
    - *Automaticé la derivación a vendedores humanos* (reservas, preguntas sin respuesta o errores), la verificación de la firma *HMAC* del webhook y la renovación automática del token *OAuth*.
    - *Desarrollé con Claude Code guiado por specs*: delegué la implementación por tareas y validé cada cambio con *tests unitarios y de integración* en *pytest* y revisión de código antes de integrarlo.
  ],
)

#cv-item(
  "Co-Director (antes Head of Mentors & Workshops)",
  "Ago 2025 — Presente",
  "Computer Society ITBA",
  "Buenos Aires",
  [
    - *Promovido tras 12 meses liderando mentores y workshops*; defino la agenda técnica de una organización de 25 miembros y coordiné al equipo de mentores y jurados de *hackITBA* (*200+ participantes*).
    - *Capacité a 100+ estudiantes* diseñando el temario y los workshops técnicos de *QuantumJam*, la primera competencia de *programación cuántica* de Argentina, con el respaldo de *IBM*.
  ],
)

#cv-item(
  "Profesor Particular de Programación",
  "Ene 2025 — Presente",
  "Independiente",
  "Buenos Aires",
  [
    - *Preparo a estudiantes del ITBA para Programación Imperativa y POO*: *gestión manual de memoria*, *punteros* y depuración con *GDB* en *C*; *herencia*, *polimorfismo* y *complejidad algorítmica* en *Java*.
  ],
)

// Sección PROYECTOS
#section-title("Proyectos")

#cv-item(
  "kpopbay — Marketplace de Compraventa e Intercambio",
  "2026",
  "Java 21, Spring MVC, Spring Security, JPA/Hibernate, PostgreSQL, Python, MCP",
  link("http://pawserver.it.itba.edu.ar/paw-2026b-09/")[pawserver.it.itba.edu.ar/paw-2026b-09],
  [
    - *Desarrollé en un equipo de 4 un marketplace web desplegado* con arquitectura en capas en *Maven* multimódulo, con tests en *JUnit* y *Mockito*.
    - *Diseñé las skills que obligan a los agentes de IA del equipo* (*Claude Code*) a seguir las reglas de arquitectura, testing y seguridad de la cátedra: conecté los agentes por *MCP* a un cuaderno de *NotebookLM* con las clases, enunciados y devoluciones oficiales, y escribí en *Python* un escáner que audita el código contra esas reglas.
  ],
)

#cv-item(
  "GroupBuy — Plataforma de Compras Grupales",
  "2026",
  "Next.js, TypeScript, PostgreSQL, Prisma, MercadoPago",
  link("https://github.com/MatiNovelli/GroupBuy")[github.com/MatiNovelli/GroupBuy],
  [
    - *Lideré el desarrollo en un equipo de 5*: *máquina de estados* de campañas con precios decrecientes por volumen sobre *PostgreSQL* y *Prisma*, y pagos con *MercadoPago Checkout Pro* verificando la firma *HMAC* del webhook.
  ],
)
