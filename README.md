# EKDropBubbleMenu

EKDropBubbleMenu is a nice animated menu library written in Swift.

!()

## Installation

To use **EKDropBubbleMenu** just copy folder `EKDropBubbleMenu` directly in your project. 

## Usage

1. Create instance of menu class:
```swift
var menu = EKDropBubbleMenu()
```
2. Call method createMenu with three parameters:
`viewController` - define controller where menu should be displayed
`position` - define position of main button center
`menuDirection` - define direction of expand (Up, Down, Left or Right)
```swift
menu.createMenu(self, position: CGPointMake(20, 510), menuDirection: .Up)
```

3. Add buttons:
var button = EKButton()
button.onButtonPressed = { () in
  var alertView = UIAlertView(title: "Button 1 clicked", message: "", delegate: self, cancelButtonTitle: "OK")
  alertView.show()
  menu.hideButtons()
}

## License

EKBubbleMenu is released under the MIT license.
