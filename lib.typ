#import "@preview/tablex:0.0.5": tablex, rowspanx

#let calendar() = {
  /*
  let tablex-args = (:)
tablex(
    columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr),
    stroke: (
      paint: gray,
      thickness: 0.5pt,
      dash: "dashed"
    ),
    ..tablex-args,
    [], ..lang-dict.weekdays.map(day => align(center, day)),
    ..final-data,
  )
  */

  page(

  )[
  = HI
  #tablex(
  columns: (3em, 1fr),  // 4 columns
  rows: (13%),  // at least 1 row of auto size
  align: center + horizon,
  stroke: (
      paint: gray,
      thickness: 0.5pt,
      dash: "dashed"
    ),
  [MO], [b], 
  [DI], [f], 
  [MI], [j], 
  [DO], [b], 
  [FR], [f], 
  [SA], [j], 
  [SO], [b], 

  )
  
]
}


