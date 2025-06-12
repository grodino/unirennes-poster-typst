#import "../common/src/colors.typ": *
#import "consts.typ"

#let simple-dark(..cols) = (font-sizes: consts.font-sizes) => {
  font-sizes = consts.normalize-font-sizes(font-sizes)

  context block(
    fill: primary.dark,
    width: 100%,
    height: 100%,
    outset: (left: page.margin.left, right: page.margin.right),
    {
      set align(horizon)
      set text(fill: primary.light, size: font-sizes.author)
      stack(dir: ltr, spacing: 1fr, ..cols)
    },
  )
}
