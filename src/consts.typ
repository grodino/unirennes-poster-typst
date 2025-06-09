
#let font-sizes = (
  title: 92pt,
  author: 36pt,
  heading: (64pt, 52pt, 34pt),
  text: 32pt,
)

// Takes the provided sizes and complete the rest with default values
#let normalize-font-sizes(sizes) = {
  return font-sizes + sizes
}
