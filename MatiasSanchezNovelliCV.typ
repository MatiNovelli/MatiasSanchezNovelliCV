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
  if place != none {
    grid(
      columns: (1fr, auto),
      text(style: "italic")[#place], align(right)[#location]
    )
  }
  // Descripción
  if description != none {
    v(3pt)
    set par(justify: true, leading: 0.6em)
    description
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
  Villa Ballester, Buenos Aires, Argentina
]

#v(10pt)

// Contacto (Izquierda y Derecha)
#line(length: 100%, stroke: 0.5pt + gray)
#grid(
  columns: (1fr, 1fr),
  align(left)[+54 11 5909-5532],
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
  Estudiante de *Ingeniería Informática* en *ITBA* con sólida formación en *programación y desarrollo de software*. Apasionado por la resolución de problemas y la creación de soluciones tecnológicas innovadoras. *Proactivo*, *orientado a resultados* y con habilidades para *trabajar en equipo* y adaptarse a nuevos desafíos.
]

// Sección EXPERIENCIA LABORAL
#section-title("Experiencia Laboral")

#cv-item(
  "Profesor Particular",
  "Jan 2025 — Present",
  none,
  none,
  [Dictado de clases y preparación de exámenes con alumnos de *nivel secundario* en las materias de *física*, *química* y *matemática*, así como para estudiantes de *nivel universitario* en *programación en C*.],
)

#cv-item(
  "Head of Mentors & Workshops, Computer Society ITBA",
  "Apr 2025 — Present",
  none,
  "Buenos Aires",
  [Fui responsable de organizar la *primera competencia de programación cuántica en Argentina*. Desde el departamento Mentors and Workshops, nos ocupamos de la capacitación de los participantes, coordinar espacios físicos y contactar speakers. La *QuantumJam* convocó a *más de 100 estudiantes* que implementaron el *protocolo BB84*.


  Como *Head* del departamento de *Mentors & Workshops* para *hackITBA*, lideré la *gestión técnica y logística* del evento más grande del ITBA con *más de 200 participantes*. Mi rol incluyó la *coordinación de mentores y jurados*, negociación con marcas de comida y contacto con la empresa Puentes para los premios.],
)

// Sección EDUCACIÓN
#section-title("Educación")

#cv-item(
  "Instituto tecnológico de Buenos Aires (ITBA)",
  "Mar 2024",
  "Ingeniería Informática",
  none,
  [Tercer año en curso, con materias como *programación imperativa*, *programación orientada a objetos*, *arquitectura de computadoras*, *álgebra*, *matemática discreta* y *lógica computacional* aprobadas.],
)

#section-title("Idiomas")

#align(center)[
  Inglés #h(5pt) _B2_
]
