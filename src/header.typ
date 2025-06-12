#import "consts.typ"
#import "../common/src/colors.typ": *

#let dark-body-light-logo(title: [], logos: ()) = (font-sizes: consts.font-sizes) => {
  font-sizes = consts.normalize-font-sizes(font-sizes)

  let logo-grid = grid(columns: 3, align: left + horizon, gutter: 1cm, ..logos)
  let inset = 2cm

  set text(font: "Unirennes", size: font-sizes.title, fill: primary.light)
  show strong: set text(font: "UniRennes Inline")
  set align(left + horizon)

  context block(
    width: 100%,
    height: 100%,
    stack(
      dir: ltr,
      rect(
        height: 100%,
        width: 100% - measure(logo-grid).width - page.margin.left,
        fill: primary.dark,
        outset: (left: page.margin.left),
        radius: (bottom-right: 100%),
        title,
      ),
      block(inset: inset, logo-grid),
    ),
  )
}

#let title-authors-light(
  title: [],
  authors: (),
  affiliations: (:),
  left: [],
  right: [],
) = (font-sizes: consts.font-sizes) => block(
  height: 100%,
  width: 100%,
  {
    // Assign an symbol to each affilitation + equal contribution sign
    let affl-sym = (:)
    for (id, affl) in affiliations.keys().enumerate() {
      affl-sym.insert(affl, str(id + 1))
    }
    affl-sym.insert("equal", sym.suit)

    set align(horizon + center)

    // Title and authors center block
    let title-authors = grid(
      columns: authors.len(),
      gutter: 1cm,
      row-gutter: (2cm, 1cm),
      align: center,
      // Title
      grid.cell(colspan: authors.len(), text(font: "UniRennes", size: font-sizes.title, weight: "bold", title)),

      // Authors
      ..for author in authors {
        // Add all the affiliation/attribution symbols
        let affl-str = if type(author.affiliations) == str {
          affl-sym.at(author.affiliations)
        } else {
          author.affiliations.map(it => affl-sym.at(it)).join(" ")
        }

        // Display author + affiliation/attribution symbols
        (text(size: font-sizes.author, author.name + super(affl-str)),)
      },

      // Affiliations
      grid.cell(
        colspan: authors.len(),
        grid(
          columns: 3,
          row-gutter: .5cm,
          column-gutter: 1cm,
          ..for (affl-id, affiliation) in affiliations.pairs() {
            (super(affl-sym.at(affl-id)) + affiliation,)
          },
        ),
      )
    )

    grid(
      columns: (17.5%, 65%, 17.5%),
      left, title-authors, right,
    )
  },
)
