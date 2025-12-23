#set page(
  paper: "us-letter",
  margin: (x: 1.5cm, y: 1.5cm),
)

// Configuración de fuente (Serif para que se parezca a la imagen)
#set text(
  font: "New Computer Modern",
  size: 10pt,
  lang: "es"
)

// --- Funciones de Ayuda para el Diseño ---

// Función para los títulos de sección (Barra gris centrada)
#let section-title(title) = {
  v(10pt)
  block(
    fill: luma(245), // Gris muy claro
    width: 100%,
    inset: (y: 6pt),
    radius: 2pt,
    align(center)[
      #text(weight: "bold", spacing: 2pt)[#upper(title)]
    ]
  )
  v(5pt)
}

// Función para los items de experiencia y educación
#let cv-item(role, date, place, location, description) = {
  grid(
    columns: (1fr, auto),
    // Fila 1: Título y Fecha
    text(weight: "bold")[❖ #role], align(right)[#date],
  )
  // Fila 2: Lugar y Ubicación (si existen)
  if place != "" {
    grid(
      columns: (1fr, auto),
      text(style: "italic")[#place], align(right)[#location]
    )
  }
  // Descripción
  if description != "" {
    v(3pt)
    par(justify: true, leading: 0.6em)[#description]
  }
  v(8pt)
}

// --- Inicio del Documento ---

// Encabezado
#align(center)[
  #text(size: 18pt)[MATIAS SANCHEZ NOVELLI] \
  #v(5pt)
  #text(weight: "bold")[Estudiante de Ingeniería Informática] \
  #v(2pt)
  Villa Ballester, 1653, Argentina
]

#v(10pt)

// Contacto (Izquierda y Derecha)
#line(length: 100%, stroke: 0.5pt + gray)
#grid(
  columns: (1fr, 1fr),
  align(left)[01159095532],
  align(right)[msancheznovelli\@itba.edu.ar]
)
#line(length: 100%, stroke: 0.5pt + gray)

// Sección LINKS
#section-title("Links")
#align(center)[
  #link("https://www.linkedin.com/in/matias-sanchez-novelli-765b851ab/")[_LinkedIn_], 
  #link("https://github.com/MatiNovelli")[_Github_]
]

// Sección PROFILE
#section-title("Profile")
#par(justify: true)[
  Estudiante de Ingeniería Informática en ITBA con sólida formación en programación y desarrollo de software. Apasionado por la resolución de problemas y la creación de soluciones tecnológicas innovadoras. Proactivo, orientado a resultados y con habilidades para trabajar en equipo y adaptarse a nuevos desafíos.
]

// Sección EXPERIENCIA LABORAL
#section-title("Experiencia Laboral")

#cv-item(
  "Profesor Particular",
  "Jan 2025 — Present",
  "",
  "",
  "Dictado de clases y preparación de exámenes con alumnos de nivel secundario en las materias de física, química y matemática, así como para estudiantes de nivel universitario en programación en C."
)

#cv-item(
  "Head of Mentors & Workshops, Computer Society ITBA",
  "Apr 2025 — Present",
  "",
  "Buenos Aires",
  "Creamos y organizamos la primera competencia de programación cuántica en Argentina. Desde el departamento Mentors and Workshops, fui responsable de la capacitación de los participantes, así como de coordinar los espacios físicos para el desarrollo de la competencia y contactar a los speakers del evento. La QuantumJam convocó a más de 100 estudiantes de diversas universidades de todo el país, quienes debieron implementar el protocolo de comunicación cuántica BB84 como parte de la evaluación."
)

// Sección EDUCACIÓN
#section-title("Educación")

#cv-item(
  "Instituto tecnológico de Buenos Aires (ITBA)",
  "Mar 2023",
  "Ingeniería Informática",
  "",
  "Tercer año en curso, con materias como programación imperativa, programación orientada a objetos, arquitectura de computadoras, álgebra, matemática discreta y lógica computacional aprobadas."
)

#section-title("Idiomas")

#align(center)[
  Español #h(5pt) _Native speaker_ \
  #v(5pt) // Espacio vertical entre líneas
  Inglés #h(5pt) _B2_
]
