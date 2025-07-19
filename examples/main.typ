#import "@local/gruvbox:1.0.0": gruvbox

#set page(paper: "a6")
#let content = [
  = #lorem(4)
  #lorem(15)#footnote[#lorem(5)]
  #highlight(lorem(3))@smith2023quantum
  #line()
  #table(
    columns: 2,
    ..for i in range(6) {
      (lorem(1),)
    },
  )
  #link("https://github.com/arsmoriendy/typst-gruvbox")
]

#show: gruvbox.with(theme: "dark", contrast: "hard")
#content
#show: gruvbox.with(theme: "dark", contrast: "medium")
#content
#show: gruvbox.with(theme: "dark", contrast: "soft")
#content
#show: gruvbox.with(theme: "light", contrast: "hard")
#content
#show: gruvbox.with(theme: "light", contrast: "medium")
#content
#show: gruvbox.with(theme: "light", contrast: "soft")
#content
#show: gruvbox.with(print: true)
#content

#pagebreak()
#bibliography("refs.bib")
