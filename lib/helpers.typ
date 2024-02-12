#let load-language(lang, language-file: "languages.toml") = {
  let language-dict = toml(language-file)
  if lang in language-dict {
    language-dict.at(lang)
  } else {
    panic("Unfortunately, `" + lang + "` does not exist in `" + language-file + "`.")
  }
}