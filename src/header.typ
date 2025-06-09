#import "consts.typ"
#import "../common/src/colors.typ": *

#let dark-body-light-logo(title: [], logos: (), font-sizes: consts.font-sizes) = {
  font-sizes = consts.normalize-font-sizes(font-sizes)

  let logo-grid = grid(columns: 3, align: left + horizon, gutter: 1cm, ..logos)
  let inset = 2cm

  set text(font: "Unirennes", size: font-sizes.title, fill: primary.light)
  show strong: set text(font: "UniRennes Inline")
  set align(left + horizon)

  context block(
    width: 100%,
    height: 100%,
    clip: true,
    stack(
      dir: ltr,
      rect(
        height: 100%,
        width: 100% - measure(logo-grid).width - 2 * inset,
        fill: primary.dark,
        inset: inset,
        radius: (bottom-right: 100%),
        title,
      ),
      block(inset: inset, logo-grid),
    ),
  )
}
