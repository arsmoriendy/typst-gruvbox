#import "colors.typ": colors

#let themes = (
  dark: (
    fg0: colors.monochrome.at(11),
    soft: (
      bg0: colors.monochrome.at(2),
    ),
    medium: (
      bg0: colors.monochrome.at(1),
    ),
    hard: (
      bg0: colors.monochrome.at(0),
    ),
  ),
  light: (
    fg0: colors.monochrome.at(3),
    soft: (
      bg0: colors.monochrome.at(14),
    ),
    medium: (
      bg0: colors.monochrome.at(13),
    ),
    hard: (
      bg0: colors.monochrome.at(12),
    ),
  ),
)

#let gruvbox(
  theme: "dark",
  contrast: "hard",
  print: false,
  body,
) = {
  let bg0 = themes.at(theme).at(contrast).at("bg0")
  let fg0 = themes.at(theme).at("fg0")

  if print {
    bg0 = white
    fg0 = themes.light.fg0
  }

  set page(fill: bg0)
  set text(fill: fg0)
  set table(stroke: fg0)
  set line(stroke: fg0)

  body
}
