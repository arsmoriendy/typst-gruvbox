#import "colors.typ": colors
#import "schemas.typ" as sch
#import "@preview/valkyrie:0.2.2" as z

/// Higher level abstraction for `colors`
#let theme-colors = (
  dark: (
    strong: colors.bright,
    fg0: colors.light1,
    soft: (
      bg0: colors.dark0-soft,
    ),
    medium: (
      bg0: colors.dark1,
    ),
    hard: (
      bg0: colors.dark0-hard,
    ),
  ),
  light: (
    strong: colors.faded,
    fg0: colors.dark1,
    soft: (
      bg0: colors.light0-soft,
    ),
    medium: (
      bg0: colors.light0,
    ),
    hard: (
      bg0: colors.light0-hard,
    ),
  ),
  muted: colors.neutral,
)

/// - theme (string): Can be `light` or `dark`
/// - contrast (string): Can be `soft`, `medium` or `hard`
/// - accent (string): Can be `red`, `green`, `yellow`, `blue`, `purple`, `aqua` or `orange`
/// - print (boolean): Setting this to true will make the background white (`#FFFFFF`) and override the `theme` as light mode
#let gruvbox(
  theme: "dark",
  contrast: "hard",
  accent: "blue",
  print: false,
  body,
) = {
  theme = z.parse(theme, sch.available-themes)
  contrast = z.parse(contrast, sch.available-contrasts)
  accent = z.parse(accent, sch.available-accent-colors)

  let bg0 = theme-colors.at(theme).at(contrast).bg0
  if print {
    bg0 = white
    theme = "light"
  }

  let fg0 = theme-colors.at(theme).fg0
  let accent = theme-colors.at(theme).strong.at(accent)

  set page(fill: bg0)
  set text(fill: fg0)
  set table(stroke: fg0)
  set line(stroke: fg0)
  set highlight(fill: theme-colors.muted.yellow)
  show highlight: set text(fill: theme-colors.light.fg0)
  show link: set text(fill: accent)
  show ref: set text(fill: accent)
  show footnote: set text(fill: accent)

  body
}
