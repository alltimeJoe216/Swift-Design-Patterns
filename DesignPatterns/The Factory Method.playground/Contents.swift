/*
    “The Factory Method design pattern is a creational pattern that promotes loose coupling. This pattern lets callers create instances of types that have a common superclass or conform to a given protocol.”

    Excerpt From: Karoly Nyisztor. “Design Patterns in Swift 5.” Apple Books. https://books.apple.com/us/book/design-patterns-in-swift-5/id1458524152
 */

import UIKit

protocol Theme {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
}

struct LightTheme: Theme {
    var backgroundColor: UIColor = .white
    var textColor: UIColor = .black
}

struct DarkTheme: Theme {
    var backgroundColor: UIColor = .black
    var textColor: UIColor = .white
}

struct BrownTheme: Theme {
    var backgroundColor: UIColor = .brown
    var textColor: UIColor = .white
}

let label = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 44))
label.text = "What It Smell Like"

let lightTheme = LightTheme()
label.backgroundColor = lightTheme.backgroundColor
label.textColor = lightTheme.textColor

let darkTheme = DarkTheme()
label.backgroundColor = darkTheme.backgroundColor
label.textColor = darkTheme.textColor

let brownTheme = BrownTheme()
label.backgroundColor = brownTheme.backgroundColor
label.textColor = brownTheme.textColor

/*
 “We have three themes, and we used each of them to decorate the UILabel instance. Although this approach works, it's far from being perfect.

 The main problem is that clients must know each implementation type to instantiate it directly. Besides, if any of these types changes, or whenever a new theme gets created, the caller code must be adapted. Refactoring a complex code base can be time-consuming and expensive.

 Wouldn't it be better if the caller component only knew the protocol and not the implementation classes themselves?”

 Excerpt From: Karoly Nyisztor. “Design Patterns in Swift 5.” Apple Books. https://books.apple.com/us/book/design-patterns-in-swift-5/id1458524152
 
 */

