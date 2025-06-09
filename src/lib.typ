#import "../common/src/colors.typ": *
#import "../common/src/utils.typ": *
#import "../common/src/colors.typ" as unirennes-colors
#import "footer.typ"
#import "header.typ"
#import "consts.typ"

////////////////////////////////////////////////////////////////////////////////
/// GLOBAL CONFIGURATION                                                     ///
////////////////////////////////////////////////////////////////////////////////
#let unirennes-poster(
  size: none,
  header: [],
  footer: [],
  font-sizes: consts.font-sizes,
  body,
) = {
  font-sizes = consts.normalize-font-sizes(font-sizes)

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

  // Headings
  show heading: it => {
    set text(font: "UniRennes", size: font-sizes.heading.at(it.level - 1))
    it
  }


  // Body contents
  // block(
  //   height: 100%,
  //   width: 100%,
  //   inset: (x: 1em, top: 2em, bottom: 1em),
  //   columns(3, gutter: 3em, align(horizon, body)),
  // )
  body
}
