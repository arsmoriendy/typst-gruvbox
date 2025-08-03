#import "../lib.typ": gruvbox, theme-colors

#set page(paper: "a7", height: auto)
#let content = [
  = #lorem(4)
  #lorem(15)#footnote[#lorem(5)]
  #highlight(lorem(3))@smith2023quantum
  #line()
  #table(
    columns: 3,
    ..for i in range(6) {
      ([cell \##(i + 1)],)
    },
  )
  #link("https://github.com/arsmoriendy/typst-gruvy")
]

/// - clrs (array)
/// -> (array)
#let color-grid-cells(clrs) = {
  for c in clrs.values() {
    (grid.cell(rect(fill: c, height: 5mm)),)
  }
}

#let color-grid(cells) = grid(
  columns: cells.len(),
  ..cells,
  ..color-grid-cells(theme-colors.dark.hard.muted)
)

#let dark-color-grid = color-grid(color-grid-cells(
  theme-colors.dark.hard.strong,
))
#let light-color-grid = color-grid(color-grid-cells(
  theme-colors.light.hard.strong,
))

// `theme-color` tests
#show: gruvbox.with(theme-color: theme-colors.dark.hard)
#content
#dark-color-grid
#show: gruvbox.with(theme-color: theme-colors.dark.medium)
#content
#dark-color-grid
#show: gruvbox.with(theme-color: theme-colors.dark.soft)
#content
#dark-color-grid
#show: gruvbox.with(theme-color: theme-colors.light.hard)
#content
#light-color-grid
#show: gruvbox.with(theme-color: theme-colors.light.medium)
#content
#light-color-grid
#show: gruvbox.with(theme-color: theme-colors.light.soft)
#content
#light-color-grid

// `print` test
#show: gruvbox.with(print: true)
#content
#light-color-grid

// `hilight` test
#show: gruvbox.with(hl: red)
#content
#light-color-grid

// `accent` test
#show: gruvbox.with(accent: red)
#content
#light-color-grid

#pagebreak()
#bibliography("refs.bib")
