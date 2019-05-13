# WSPopup

[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Platforms iOS](https://img.shields.io/badge/Platforms-iOS-lightgray.svg?style=flat)](http://www.apple.com/ios/)
[![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg?style=flat)](https://opensource.org/licenses/MIT)

A simple and flexible way to show a popup. This is something that we were always implementing in each project so we decided to put this in a framework which we could reuse in our projects. 

It works like an `UIViewController` but it will handle the layout of your `UIView` (the view that you want to show) and even handle the keyboard events for any inputs of your view.

#### Example

You have a `SignInView` and you want to present it when the user credentials are expired.

``` swift
let exampleSignInView = ExampleSignInView()
exampleSignInView.userTextField.text = "JohnDoe123"

let popupViewController = WSPopupViewController(popupView: exampleSignInView)
popupViewController.modalPresentationStyle = .overCurrentContext
popupViewController.modalTransitionStyle = .crossDissolve
show(popupViewController, sender: self)
```

You can also just give the `UIView` Type:

``` swift
let popupViewController = WSPopupViewController(popupViewType: ExampleSignInView.self)
popupViewController.modalPresentationStyle = .overCurrentContext
popupViewController.modalTransitionStyle = .crossDissolve
show(popupViewController, sender: self)
```

Have a look at our [Example app](WSPopup/Example).

![WSPopup](https://media.giphy.com/media/5ZXA22kP4zh3nWehgR/giphy.gif)

## Installation

#### <img src="https://cloud.githubusercontent.com/assets/432536/5252404/443d64f4-7952-11e4-9d26-fc5cc664cb61.png" width="24" height="24"> [Carthage]

[Carthage]: https://github.com/Carthage/Carthage

To install it, simply add the following line to your **Cartfile**:

```ruby
github "whitesmith/WSPopup"
```

Then run `carthage update`.

Follow the current instructions in [Carthage's README][carthage-installation] for up to date installation instructions.

[carthage-installation]: https://github.com/Carthage/Carthage#adding-frameworks-to-an-application

#### Manually

Download all the source files and drop them into your project.

## Requirements

* iOS 11.0+
* Xcode 10.2 (Swift 5.0)

# Contributing

The best way to contribute is by submitting a pull request. We'll do our best to respond to your patch as soon as possible. You can also submit a [new GitHub issue](https://github.com/whitesmith/WSPopup/issues/new) if you find bugs or have questions.

# Credits
![Whitesmith](http://i.imgur.com/Si2l3kd.png)
