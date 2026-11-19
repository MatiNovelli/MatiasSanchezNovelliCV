// CV adaptado (ESPAÑOL) - Matias Sanchez Novelli
// Postulación: Founding Engineer (Backend) - CampOS (camp-os.ar), envío por mail a gaston@camp-os.ar
// Derivado de Matias-Sanchez-Novelli-cv.typ (CV maestro)
// Compilar con: typst compile Matias-Sanchez-Novelli-cv-campos.typ

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
  #text(size: 9pt, fill: medium-text)[Estudiante de Ingeniería Informática · Desarrollador Backend · Villa Ballester, Buenos Aires, Argentina]
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
  #text(size: 8.8pt)[Estudiante de *tercer año de Ingeniería Informática* en *ITBA* (graduación esperada *dic 2028*) enfocado en *desarrollo backend* con base sólida en *sistemas de bajo nivel*. Desarrollé *de punta a punta* un backend en *Python* y *FastAPI* que integra *APIs REST*, webhooks con *HMAC* y *OAuth*, y en equipo un *kernel x86-64* en *C* y *Assembly*. Busco sumarme a un *equipo fundador* para construir el backend en *Rust* de un producto que va del hardware al software.]
]

// Sección HABILIDADES TÉCNICAS
#section-title("Habilidades Técnicas")

#skill-row("Backend:", [*Python* (*FastAPI*, *asyncio*), *Java* (*Spring*), *APIs REST*, *Webhooks*, *OAuth 2.0*, *HMAC*])
#skill-row("Sistemas:", [*C*, *Assembly x86-64*, *gestión de memoria*, *concurrencia* (*semáforos*, *pipes*), *Linux/Unix*, *GDB*])
#skill-row("Bases de Datos:", [*SQL*, *PostgreSQL*, *SQLite*, *SQLAlchemy*, *JPA/Hibernate*, *Flyway*, *Prisma*])
#skill-row("Frontend:", [*React*, *Next.js*, *TypeScript*, *JavaScript*, *Tailwind CSS*])
#skill-row("Herramientas:", [*pytest*, *JUnit*, *Mockito*, *Git*, *GitHub*, *Docker*, *Docker Compose*, *Maven*])
#skill-row("Idiomas:", [*Español* (nativo) · *Inglés B2* (intermedio-avanzado)])

// Sección EDUCACIÓN
#section-title("Educación")

#cv-item(
  "Instituto Tecnológico de Buenos Aires (ITBA)",
  "Mar 2024 — Dic 2028",
  "Ingeniería Informática (en curso)",
  "Buenos Aires",
  [Materias aprobadas: *Sistemas Operativos*, *Arquitectura de Computadoras*, *Programación Imperativa* (*C*), *Programación Orientada a Objetos* (*Java*), *Bases de Datos* (*SQL*), *Ingeniería de Software*, *Matemática Discreta*.],
)

// Sección EXPERIENCIA
#section-title("Experiencia")

#cv-item(
  "Desarrollador de Software (Freelance)",
  "Ago 2026 — Presente",
  "Modo Ruta — Gerenciadora Hotelera",
  "Buenos Aires",
  [
    - *Desarrollé de punta a punta el backend de un agente de ventas por WhatsApp* para una gerenciadora hotelera que recibe *\~250 consultas diarias*: relevé requerimientos con el cliente, diseñé la arquitectura e implementé el servicio en *Python 3.12 async*, *FastAPI*, *SQLite* y *Docker Compose*.
    - *Integré la API REST del motor de reservas Octorate* como única fuente de precios y disponibilidad, validando cada búsqueda en código para que ningún dato de precio dependa del modelo de lenguaje (*API de Claude* con *tool use*).
    - *Aseguré la integración*: verificación de la firma *HMAC* del webhook, renovación automática del token *OAuth* y derivación a un vendedor humano ante errores o consultas sin respuesta, con tests unitarios y de integración en *pytest*.
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
  "Kernel x86-64 Bare-Metal",
  "2026",
  "C, Assembly x86-64, Docker, QEMU, GDB",
  link("https://github.com/MatiNovelli/so-tp2")[github.com/MatiNovelli/so-tp2],
  [
    - *Implementé un kernel que arranca sin sistema operativo subyacente* (proyecto en equipo de 8): *scheduler* con 5 niveles de prioridad, *syscalls*, *semáforos*, *pipes*, shell interactiva y dos *memory managers* intercambiables (*First-Fit* y *Buddy System*).
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
  "kpopbay — Marketplace de Compraventa e Intercambio",
  "2026",
  "Java 21, Spring MVC, Spring Security, JPA/Hibernate, PostgreSQL, Flyway, JSP, Maven",
  link("http://pawserver.it.itba.edu.ar/paw-2026b-09/")[pawserver.it.itba.edu.ar/paw-2026b-09],
  [
    - *Desarrollé en un equipo de 4 un marketplace web desplegado* con arquitectura en capas en *Maven* multimódulo: implementé la *moderación* (reportes, baja de contenido y suspensión de usuarios) y el *reseteo de contraseña* por mail con links de un solo uso, con tests de servicios y DAOs en *JUnit* y *Mockito*.
  ],
)
