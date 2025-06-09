#import "@local/unirennes-poster:0.2.0": unirennes-poster, unirennes-colors, header, footer

#set page(paper: "a1", flipped: true)

#show: unirennes-poster.with(
  header: header.dark-body-light-logo(
    title: stack(
      dir: ltr,
      spacing: 2cm,
      [
        #strong[Qu]eries, #strong[R]epresentation & #strong[D]etection:\ The Next 100 Model Fingerprinting Schemes
      ],
    ),

    logos: (
      grid.cell(rowspan: 2, image(width: 10cm, "assets/logos/irisa/50ans-color.svg")),
      image(width: 10cm, "assets/logos/univ-rennes/black.svg"),
      image(width: 5cm, "assets/logos/peren.png"),
      image(width: 10cm, "assets/logos/inria/red.svg"),
      image(width: 6cm, fit: "cover", "assets/logos/hi-paris.png"),
    ),
  ),
  footer: footer.simple-dark(
    [AAAI25 - Philadelphia, USA],
    [#underline[Augustin Godinot], Gilles Tredan, Erwan Le Merrer, Camilla Penzo, Francois Taiani],
    [#link("mailto:augustin.godinot@inria.fr") -- #link("https://grodino.github.io/", "grodino.github.io/")],
  ),
)
