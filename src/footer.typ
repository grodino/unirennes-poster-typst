#import "../common/src/colors.typ": *
#import "consts.typ": font-sizes

#let simple-dark(..cols) = block(
  fill: primary.dark,
  width: 100%,
  height: 100%,
  inset: (x: 1em),
  {
    set align(horizon)
    set text(fill: primary.light, size: font-sizes.author)
    stack(dir: ltr, spacing: 1fr, ..cols)
  },
)
