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
  lang: "en",
  fill: dark-text,
)

#set par(leading: 0.7em)

// Global link styling
#show link: it => text(fill: accent-color)[#underline(it)]

// --- Layout Helper Functions ---

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

// --- Document Start ---

// Header
#align(center)[
  #text(size: 22pt, weight: "bold", tracking: 2pt, fill: accent-color)[MATIAS SANCHEZ NOVELLI]
  #v(6pt)
  #text(size: 11pt, weight: "regular", fill: medium-text, tracking: 0.5pt)[Computer Engineering Student]
  #v(4pt)
  #text(size: 9pt, fill: medium-text)[Villa Ballester, Buenos Aires, Argentina]
]

#v(8pt)

// Contact
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

// PROFILE Section
#section-title("Profile")
#par(justify: true)[
  #text(size: 9.5pt)[*Computer Engineering* student at *ITBA* with a strong foundation in *programming and software development*. Passionate about problem-solving and creating innovative technological solutions. *Proactive*, *results-oriented*, and skilled at *teamwork* and adapting to new challenges.]
]

// WORK EXPERIENCE Section
#section-title("Work Experience")

#cv-item(
  "Private Tutor",
  "Jan 2025 — Present",
  none,
  none,
  [Teaching classes and preparing exams with *high school* students in *physics*, *chemistry*, and *mathematics*, as well as with *university-level* students in *C programming*.],
)

#cv-item(
  "Head of Mentors & Workshops, Computer Society ITBA",
  "Apr 2025 — Present",
  none,
  "Buenos Aires",
  [I was responsible for organizing the *first quantum programming competition in Argentina*. From the Mentors and Workshops department, we handled participant training, coordinated physical venues, and contacted speakers. *QuantumJam* brought together *more than 100 students* who implemented the *BB84 protocol*.

  As *Head* of the *Mentors & Workshops* department for *hackITBA*, I led the *technical and logistical management* of ITBA's largest event with *more than 200 participants*. My role included *coordinating mentors and judges*, negotiating with food brands, and contacting the company Puentes for prizes.],
)

// EDUCATION Section
#section-title("Education")

#cv-item(
  "Instituto Tecnológico de Buenos Aires (ITBA)",
  "Mar 2024",
  "Computer Engineering",
  none,
  [Third year in progress, with courses such as *imperative programming*, *object-oriented programming*, *computer architecture*, *algebra*, *discrete mathematics*, and *computational logic* passed.],
)

// LANGUAGES Section
#section-title("Languages")

#align(center)[
  #box(
    inset: (x: 12pt, y: 5pt),
    radius: 3pt,
    fill: light-accent,
    text(fill: accent-color, weight: "medium")[English — B2]
  )
]
