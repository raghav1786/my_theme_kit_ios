
# A scalable approach to create custom fonts and colours for your iOS app

## Problem Statement
- We need an efficient and maintainable solution for creating custom fonts and
colors for our app that supports both SwiftUI and UIKit.
- Colors and fonts vary according to the market version of the app.

Eg. 
- India has Font : X1 Color: Y1

<img width="200" alt="Screenshot 2023-06-20 at 00 01 59" src="https://github.com/raghav1786/my_theme_kit_ios/assets/53406407/544c9a50-8bda-4d04-ba10-e157a3b0d7b2">

- US has Font: X2 Color Y2

<img width="200" alt="Screenshot 2023-06-20 at 00 02 42" src="https://github.com/raghav1786/my_theme_kit_ios/assets/53406407/8030f7b9-175f-46f8-823f-ea681c50a191">


## Solution:
we can achieve result in number of ways. But in this article we will try to approach it using App theming.
**App theming** is the process of customizing the look and feel of an app. This can include changing the colors, fonts, and other visual elements of the app. App theming can be used to create a more visually appealing and engaging app experience, or to make the app more accessible to users with different needs.

## Approach:
1. we will create a **Theme** enum that shall support multiple markets.we need to set current Theme in appDelegate or starting point of app

```
Theme.current = .india

public enum Theme {
    case usa
    case india

    public static var current = Theme.taiwan {
           didSet {
           // once theme is set , we can register font for that theme
           let fontName = FontFamily.fontName(theme: current)
            FontFamily.registerFonts(fontName: fontName)
           }
    }
}
```

2. Colors: 

- create a new __.xcassets__ file for Colors with name __Colors.xcassets__

- add static reference for above assets from UIColor+Extension.

``` 
extension UIColor {

    static func white(theme: Theme) -> UIColor {
        let assetName = UIColor.assetName("white",
                                          theme: theme)
        return UIColor(named: assetName, in: .module, compatibleWith: nil) ?? .clear
    }
}
```

- create a ColorType struct to support UIKit and SwiftUI apps.

```
public struct ColorType {
    public private(set) var uiColor: UIColor
    /// Provides color for the ui elements.
    public var color: Color {
        // convert UIKit color to swiftUI
        uiColor.suiColor
    }
}
```
- create a Extension from Theme enum : Theme+ColorExtension.swift which holds the Color Type and shares color for uikit and SwiftUI.

``` 
public extension Theme {

    var white: ColorType {
        let uiColor = UIColor.white(theme: self)
        return ColorType(uiColor: uiColor)
    }
}
```

> we are done,here is how you can use the color in your Project
> SwiftUI: Theme.market1.black.color 
> UIKit: Theme.market1.black.uicolor


2.Fonts:

- add a FontFamily enum with cases as custom fonts.

``` 
enum FontFamily {
        case headline1(theme: Theme)
        case headline2(theme: Theme)

        //gives custom font for case mentioned above
        var font: {...} 
        //gives lineHeight for case mentioned above
        var lineHeight: {...}
}
```

- create a FontStyle struct to support UIKit and SwiftUI apps.

``` 
public struct FontStyle {
        public private(set) var uiFont: UIFont
        public var font: Font {
            // support swift ui fonts
            return uiFont.suiFont
        }
        public var lineHeight: CGFloat
}
```
    
- create a Extension from Theme enum : Theme+FontExtension.swift which holds the FontStyle  and shares fonts for uikit and SwiftUI.

``` 
public extension Theme {
        var headline1: FontStyle {
            let fontStyle = FontFamily.headline1(theme: self)
            return FontStyle(uiFont: fontStyle.font,
                            lineHeight: fontStyle.lineHeight,
                            scaledUIFont: fontStyle.scaledUIFont)
        }
}
```

> we are done, here is how you can use the Font in your Project
> SwiftUI: Theme.market1.headline1.font
> UIKit: Theme.market1.headline1.uiFont.


## Demo APP

[MyThemeKitDemo.zip](https://github.com/raghav1786/my_theme_kit_ios/files/11791275/MyThemeKitDemo.zip)



## Conclusion
Above solution can be scaled up to support as many markets we need.
also we can keep on adding more fonts and colors as per our design system.

Note: we can also keep this entire code in Swift Package and use it as stand alone component .
