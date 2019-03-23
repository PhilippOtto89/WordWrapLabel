# WordWrapLabel

[![Version](https://img.shields.io/cocoapods/v/WordWrapLabel.svg?style=flat)](https://cocoapods.org/pods/WordWrapLabel)
[![License](https://img.shields.io/cocoapods/l/WordWrapLabel.svg?style=flat)](https://cocoapods.org/pods/WordWrapLabel)
[![Platform](https://img.shields.io/cocoapods/p/WordWrapLabel.svg?style=flat)](https://cocoapods.org/pods/WordWrapLabel)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

WordWrapLabel is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WordWrapLabel'
```

## Description

A UILabel subclass that really makes sure that every word in the label´s text fits into one line.

The standard UILabel can automatically adjust the scale of the font size to make the whole text fit the label bounds but it doesn´t take into account the actual length of the different words of the given text. This results in words being broken up into multiple lines because they are too long to fit one line.

![](/Screenshots/Screenshot1.png?raw=true "Standard UILabel with word split up into multiple lines")

The WordWrapLabel finds the suitable font size to make every word of the given text fit into one line.

![](/Screenshots/Screenshot2.png?raw=true "WordWrapLabel made sure every word fits a line")

It also makes sure that the text fits into the whole bounds of the label when there is a line number or height restriction.

![](/Screenshots/Screenshot3.png?raw=true "WordWrapLabel making the text fit into the line number or given height")

## Author

Philipp, philipp_otto@live.de

## License

WordWrapLabel is available under the MIT license. See the LICENSE file for more info.
