#import "@preview/tablex:0.0.5": tablex, rowspanx
#import "lib/helpers.typ" as lib


#let calendar_week(
  week_number,
  language: "en",
  table_args: (:),
) = {
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
    [], ..lang_dict.weekdays.map(day => align(center, day)),
    ..final-data,
  )
  */

  let lang_dict = if type(language) == str {
    lib.load-language(language)
  } else { language }

  let final_data = (:)
page(
margin: (
  inside: 1.0cm, outside: .5cm, y: 0.5cm),
  numbering: "1",
  )[
  = #week_number

  /*
  #tablex(
  columns: (2em, 1fr),  // 4 columns
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

  ) */
  #tablex(
    columns: (2em,2em, 1fr,1fr,1fr,1fr,1fr,1fr,1fr,1fr,),
    rows: (13%),
    stroke: (
      paint: gray.lighten(50%),
      thickness: 0.5pt,
    ),
    ..table_args,
    ..(lang_dict.weekdays.zip(range(1,8).map(
      number => str(number)
    ))
    .intersperse(("","","","","","","","",))
    .flatten().map(day => align(center, day))
    ),
    ..final_data,
  )
  
]
  
}
#let calendar_month(
  month,
  language: "de",
  slice,
  table_args: (:),
) = {

  let lang_dict = if type(language) == str {
    lib.load-language(language)
  } else { language }

  let search(m) = {
    m == month
  }
  let n = {
    lang_dict.months.position(search) + 1
    }

  let final_data = (" ", )

  let days_in_month = (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
  let days = range(1,days_in_month.at(n - 1 ) + 1)
page(
  margin: (inside: 1.0cm, outside: .5cm, y: 0.5cm)
  )[
  =  #n:  #month 
  #tablex(
    columns: (auto, auto, 1fr,),
    rows: (3.1%),
    stroke: (
      paint: gray.lighten(50%),
      thickness: 0.5pt,
      
    ),
    ..table_args,
    ..days.zip(
      lang_dict.weekdays.slice(slice) + lang_dict.weekdays + lang_dict.weekdays + lang_dict.weekdays + lang_dict.weekdays
    )
    .intersperse("").flatten()
    .map(day => align(center, [ #day ])),
    ..final_data,
  )
  ]
}

#let calendar_year(
  year,
  language: "de",
  table_args: (:),
) = {

  let lang_dict = if type(language) == str {
    lib.load-language(language)
  } else { language }

  let final_data = (" ", )
page(
  flipped: true,
  margin: (
  left: 5pt, 
  top: 50pt, 
  right: 5pt, 
  bottom: 5pt)
  )[
  = #year
  #tablex(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr,),
    stroke: (
      paint: gray.lighten(50%),
      thickness: 0.5pt,
    ),
    ..table_args,
    ..lang_dict.months.map(day => align(center, day)),
    ..final_data,
  )
  
]


}

