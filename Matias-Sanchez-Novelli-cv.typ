// CV maestro (ESPAÑOL) - Matias Sanchez Novelli
// Estilo visual basado en documents/cv/Matias-Sanchez-Novelli-cv.typ
// Compilar con: typst compile cv/cv_es.typ

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
  #text(size: 9pt, fill: medium-text)[Estudiante de Ingeniería Informática · Desarrollador de Software · Villa Ballester, Buenos Aires, Argentina]
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
  #text(size: 8.8pt)[Estudiante de *cuarto año de Ingeniería Informática* en *ITBA* (graduación esperada *dic 2028*) y desarrollador *full stack* orientado a *IA aplicada*. Desarrollé y *puse en producción* un *agente de ventas con IA por WhatsApp* sobre la *API de Claude* y *reduje un 48 % su costo por llamada al modelo*. Co-dirijo *Computer Society ITBA*. Disponible para *pasantía*, *trainee* o puesto *Junior part-time*.]
]

// Sección HABILIDADES TÉCNICAS
#section-title("Habilidades Técnicas")

#skill-row("IA Aplicada:", [*API de Claude*, *tool use / function calling*, *prompt engineering*, *prompt caching*, *Claude Code*])
#skill-row("Backend:", [*Python 3.12* (*FastAPI*), *Java 21* (*Spring MVC*, *Spring Security*), *APIs REST*, *Webhooks*])
#skill-row("Datos:", [*PostgreSQL*, *SQLite*, *SQL*, *JPA/Hibernate*, *Flyway*])
#skill-row("Testing:", [*pytest*, *JUnit*, *Mockito*, *testing unitario*, *testing de integración*])
#skill-row("Frontend y Mobile:", [*TypeScript*, *JavaScript*, *React*, *Tailwind CSS*])
#skill-row("Sistemas:", [*C*, *Assembly x86-64*, *Linux/Unix*, *Git*, *GitHub*, *Docker*, *Maven*, *GDB*, *QEMU*])
#skill-row("Idiomas:", [*Español* (nativo) · *Inglés B2* (intermedio-avanzado)])

// Sección EDUCACIÓN
#section-title("Educación")

#cv-item(
  "Instituto Tecnológico de Buenos Aires (ITBA)",
  "Mar 2024 — Dic 2028",
  "Ingeniería Informática (en curso)",
  "Buenos Aires",
  [Materias aprobadas: *Programación Imperativa* (*C*), *Programación Orientada a Objetos* (*Java*), *Bases de Datos* (*SQL*), *Sistemas Operativos*, *Arquitectura de Computadoras*, *Ingeniería de Software*, *Estructura de Datos y Algoritmos*, *Proyecto de Aplicaciones Web (PAW)*, *Protocolos de Comunicación*.],
)

// Sección EXPERIENCIA
#section-title("Experiencia")

#cv-item(
  "Desarrollador de Software (Freelance)",
  "Oct 2026 — Presente",
  "Modo Ruta — Alquileres Temporarios",
  "Buenos Aires",
  [
    - *Desarrollé y puse en producción un agente de ventas con IA por WhatsApp* (*Python*, *FastAPI*, *API de Claude*, *tool use*) para una empresa de *95 departamentos* con *\~250 consultas diarias* en temporada alta, que cotiza en tiempo real con *Octorate*.
    - *Construí un panel web para vendedores* (*React 19*, *TypeScript*, *Tailwind CSS*, *TanStack Query*) para tomar y devolver chats al bot, con roles, respuestas rápidas y edición de las instrucciones del bot sin tocar código.
    - *Reduje un 48 % el costo por llamada al modelo* con *prompt caching* (81 % de aciertos de caché en producción), tras medir que el 82 % del gasto era entrada sin caché, y recorté los resultados de las herramientas y las llamadas sobrantes.
    - *Aislé al LLM del cálculo de precios* validando en código cada llamada a herramientas, con LLM intercambiable (*Claude*, *Gemini*, *OpenAI*), webhook con firma *HMAC*, tests en *pytest* y despliegue con *Docker Compose* y *Cloudflare Tunnel*.
  ],
)

#cv-item(
  "Co-Director (antes Head of Mentors & Workshops)",
  "Ago 2025 — Presente",
  "Computer Society ITBA",
  "Buenos Aires",
  [
    - *Promovido a Co-Director tras 12 meses* liderando mentores y workshops en una organización de *25 miembros*.
    - Organicé la *QuantumJam*, la primera competencia de *programación cuántica* de Argentina, con el respaldo de *IBM*.
    - *Coordiné al equipo de mentores y jurados de hackITBA* (*200+ participantes*).
  ],
)

#cv-item(
  "Profesor Particular de Programación",
  "Ene 2025 — Presente",
  "Independiente",
  "Buenos Aires",
  [
    - *Preparo a estudiantes del ITBA para Programación Imperativa y POO*: *gestión manual de memoria*, *punteros* y depuración con *GDB* en *C*; *herencia*, *polimorfismo* y *estructuras de datos* en *Java*.
  ],
)

// Sección PROYECTOS
#section-title("Proyectos")

#cv-item(
  "kpopbay — Marketplace de Compraventa e Intercambio",
  "2026",
  "Java 21, Spring MVC, Spring Security, JPA/Hibernate, PostgreSQL, Flyway, JSP, Maven",
  link("http://pawserver.it.itba.edu.ar/paw-2026b-09/")[pawserver.it.itba.edu.ar/paw-2026b-09],
  [
    - *Desarrollé en un equipo de 4 un marketplace web desplegado* con arquitectura en capas (*Maven* multimódulo).
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

#cv-item(
  "Kernel x86-64 Bare-Metal",
  "2026",
  "C, Assembly x86-64, Docker, QEMU, GDB",
  link("https://github.com/MatiNovelli/so-tp2")[github.com/MatiNovelli/so-tp2],
  [
    - *Implementé un kernel que arranca sin sistema operativo subyacente*: *scheduler* con 5 niveles de prioridad, *syscalls*, *semáforos*, *pipes*, shell interactiva y dos *memory managers* intercambiables (*First-Fit* y *Buddy System*).
  ],
)
