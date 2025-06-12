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
  header: none,
  footer: none,
  font-sizes: consts.font-sizes,
  body,
) = {
  font-sizes = consts.normalize-font-sizes(font-sizes)
  let margins = (x: 2cm, bottom: 2cm, top: 13cm)

  if footer == none {
    margins.insert("bottom", 0cm)
  }

  set page(
    // Set the page dimensions
    ..if size == none { (paper: "a0") },
    ..if size != none { (height: size.at(0), width: size.at(1)) },
    // Margins
    margin: margins,
    header-ascent: 1cm,
    footer-descent: 0pt,
    // Content of header and footer
    header: header(font-sizes: font-sizes),
    footer: if footer != none { footer(font-sizes: font-sizes) },
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
