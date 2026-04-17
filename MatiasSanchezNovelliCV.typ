#let accent-color = rgb("#2b4c7e")
#let light-accent = rgb("#e8eef5")
#let dark-text = rgb("#2c2c2c")
#let medium-text = rgb("#555555")

#set page(
  paper: "us-letter",
  margin: (x: 1.8cm, y: 1.5cm),
)

#set text(
  font: "New Computer Modern",
  size: 10pt,
  lang: "es",
  fill: dark-text,
)

#set par(leading: 0.7em)

// Estilo global de links
#show link: it => text(fill: accent-color)[#underline(it)]

// --- Funciones de Ayuda para el Diseño ---

#let section-title(title) = {
  v(12pt)
  grid(
    columns: (auto, 1fr),
    column-gutter: 8pt,
    align(horizon)[
      #text(weight: "bold", fill: accent-color, size: 11pt, tracking: 1.5pt)[#upper(title)]
    ],
    align(horizon)[
      #line(length: 100%, stroke: 1pt + accent-color)
    ],
  )
  v(6pt)
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
      #text(weight: "bold", size: 10.5pt)[#role]
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
    v(4pt)
    set par(justify: true, leading: 0.6em)
    text(size: 9.5pt)[#description]
  }
  v(10pt)
}

// --- Inicio del Documento ---

// Encabezado
#align(center)[
  #text(size: 22pt, weight: "bold", tracking: 2pt, fill: accent-color)[MATIAS SANCHEZ NOVELLI]
  #v(6pt)
  #text(size: 11pt, weight: "regular", fill: medium-text, tracking: 0.5pt)[Estudiante de Ingeniería Informática]
  #v(4pt)
  #text(size: 9pt, fill: medium-text)[Villa Ballester, Buenos Aires, Argentina]
]

#v(8pt)

// Contacto
#align(center)[
  #box(
    inset: (x: 12pt, y: 8pt),
    radius: 4pt,
    stroke: 0.5pt + luma(200),
    grid(
      columns: (auto, auto, auto),
      column-gutter: 20pt,
      text(size: 9.5pt)[+54 11 5909-5532],
      text(size: 9.5pt)[msancheznovelli\@itba.edu.ar],
      text(size: 9.5pt)[
        #link("https://www.linkedin.com/in/matias-sanchez-novelli-765b851ab/")[LinkedIn] ·
        #link("https://github.com/MatiNovelli")[Github]
      ],
    )
  )
]

// Sección PROFILE
#section-title("Perfil")
#par(justify: true)[
  #text(size: 9.5pt)[Estudiante de *Ingeniería Informática* en *ITBA* con sólida formación en *programación y desarrollo de software*. Apasionado por la resolución de problemas y la creación de soluciones tecnológicas innovadoras. *Proactivo*, *orientado a resultados* y con habilidades para *trabajar en equipo* y adaptarse a nuevos desafíos.]
]

// Sección EXPERIENCIA LABORAL
#section-title("Experiencia Laboral")

#cv-item(
  "Profesor Particular",
  "Ene 2025 — Presente",
  none,
  none,
  [Dictado de clases y preparación de exámenes con alumnos de *nivel secundario* en las materias de *física*, *química* y *matemática*, así como para estudiantes de *nivel universitario* en *programación en C*.],
)

#cv-item(
  "Head of Mentors & Workshops, Computer Society ITBA",
  "Abr 2025 — Presente",
  none,
  "Buenos Aires",
  [Fui responsable de organizar la *primera competencia de programación cuántica en Argentina*. Desde el departamento Mentors and Workshops, nos ocupamos de la capacitación de los participantes, coordinar espacios físicos y contactar speakers. La *QuantumJam* convocó a *más de 100 estudiantes* que implementaron el *protocolo BB84*.

  Como *Head* del departamento de *Mentors & Workshops* para *hackITBA*, lideré la *gestión técnica y logística* del evento más grande del ITBA con *más de 200 participantes*. Mi rol incluyó la *coordinación de mentores y jurados*, negociación con marcas de comida y contacto con la empresa Puentes para los premios.],
)

// Sección EDUCACIÓN
#section-title("Educación")

#cv-item(
  "Instituto Tecnológico de Buenos Aires (ITBA)",
  "Mar 2024",
  "Ingeniería Informática",
  none,
  [Tercer año en curso, con materias como *programación imperativa*, *programación orientada a objetos*, *arquitectura de computadoras*, *álgebra*, *matemática discreta* y *lógica computacional* aprobadas.],
)

// Sección IDIOMAS
#section-title("Idiomas")

#align(center)[
  #box(
    inset: (x: 12pt, y: 5pt),
    radius: 3pt,
    fill: light-accent,
    text(fill: accent-color, weight: "medium")[Inglés — B2]
  )
]
