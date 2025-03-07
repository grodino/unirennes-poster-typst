#import "../common/src/colors.typ": *
#import "../common/src/utils.typ": *
#import "../common/src/colors.typ" as unirennes-colors
#import "footer.typ"
#import "header.typ"
#import "consts.typ": font-sizes

////////////////////////////////////////////////////////////////////////////////
/// GLOBAL CONFIGURATION                                                     ///
////////////////////////////////////////////////////////////////////////////////
#let unirennes-poster(
  size: none,
  header: [],
  footer: [],
  logos: none,
  split-size: 25%,
  notes: "hide",
  body,
) = {
  set page(
    // Set the page dimensions
    ..if size == none { (paper: "a0") },
    ..if size != none { (height: size.at(0), width: size.at(1)) },
    // Margins
    margin: (x: 0pt, bottom: 2cm, top: 12cm),
    header-ascent: 0pt,
    footer-descent: 0pt,
    // Content of header and footer
    header: header,
    footer: footer,
  )

  // List marker
  set list(marker: sym.triangle.filled.r)

  // Regular text properties
  set text(font: "Newsreader", size: font-sizes.text)
  set par(justify: true)

  // Headings. Need this ugly foo loop to allow theme user to customize
  // headings appearance via show rules.
  for level in range(3) {
    show heading.where(level: level): set text(font: "UniRennes", size: font-sizes.heading.at(level))
  }
  show heading: set align(left)
  show heading: set text(font: "UniRennes")


  // Body contents
  block(
    height: 100%,
    width: 100%,
    inset: (x: 1em, top: 2em, bottom: 1em),
    columns(3, gutter: 3em, align(horizon, body)),
  )
}
