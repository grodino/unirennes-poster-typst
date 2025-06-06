#import "@local/unirennes-poster:0.2.0": unirennes-poster, unirennes-colors

#show: unirennes-poster.with(
  author: grid(columns: (60%, 40%))[
    #set align(center)

    Professeur Tournesol\
    Université de Rennes, Moulinsart
  ][
    #set align(right)
    #set text(font: "UniRennes", size: 100pt, fill: unirennes-colors.accent-orange.light)
    *CHANGE MY MIND*
  ],
  title: [Large models are #text(font: "UniRennes Inline", fill: unirennes-colors.accent-orange.light)[impossible] to
    regulate.],
  info: stack(
    dir: ltr,
    spacing: 1fr,
    [5e Conférence sur les Trésors de Rakham le Rouge],
    [Tintin (Le Petit Vingtième), Milou (Dans l'Os), Haddock (Le Karaboudjan)],
    [#link("mailto:proffeseur.tournesol@univ-rennes.fr") -- #link(
        "https://fr.wikipedia.org/wiki/Les_Aventures_de_Tintin",
        "wiki.tintin.be",
      )],
  ),
  logos: (
    "left": image("assets/logos/univ-rennes.png"),
    "right": image("assets/logos/univ-rennes.png"),
  ),
)
