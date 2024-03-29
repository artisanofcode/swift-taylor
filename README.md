# Taylor.swift

Taylor makes beautiful words happen, a Lorem Ipsum generator for Swift.

## 🛠 Installing

### Swift Package Manager

Please see see [the WWDC presentation](https://developer.apple.com/videos/play/wwdc2019/408/) for
instructions on using Swift packages in your application.

Use `https://github.com/artisanfcode/swift-taylor.git` as url for the `Taylor` package dependency.

## 🎓 Usage

Taylor provides static methods for generating different types of text.

### Words

Generate lowercase words of either a fixed or random length seperated by a space.

```swift
let one = Taylor.word()
let ten = Taylor.words(10)
let fiveToTen = Taylor.words(5...10)
```

### Sentences

Generate capitalised sentences of either fixed or random length, each ending in a period.

```swift
let one = Taylor.sentence()
let ten = Taylor.sentences(10)
let fiveToTen = Taylor.sentences(5...10)
```

### Paragraphs

Generate paragraphs of sentences, either fixed or random length, each seperated by a newline.

```swift
let one = Taylor.paragraph()
let ten = Taylor.paragraphs(10)
let fiveToTen = Taylor.paragraphs(5...10)
```

### Titles

Generate a capitalised title.

```swift
let title = Taylor.title()
```

## ⚖️ Licence

This project is licensed under the [MIT licence](http://dan.mit-license.org/).

All documentation and images are licenced under the 
[Creative Commons Attribution-ShareAlike 4.0 International License][cc_by_sa].

[cc_by_sa]: https://creativecommons.org/licenses/by-sa/4.0/

## 📝 Meta

This project uses [Semantic Versioning](http://semver.org/).
