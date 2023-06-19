//
//  Theme+ColorExtension.swift
//  
//
//  Created by RAGHAV SHARMA on 19/06/23.
//

import SwiftUI

public extension Theme {
    var blue: ColorType {
        let uiColor = UIColor.blue(theme: self)
        return ColorType(uiColor: uiColor)
    }
    var red: ColorType {
        let uiColor = UIColor.red(theme: self)
        return ColorType(uiColor: uiColor)
    }
}



// MARK: ColorType provides support for UIColor and Color

import SwiftUI
public struct ColorType {
  public private(set) var uiColor: UIColor
  public var color: Color {
    uiColor.suiColor
  }
}

// MARK: UIColor to Color

extension UIColor {
  var suiColor: Color {
    if #available(iOS 15, *) {
      return Color(uiColor: self)
    } else {
      return Color(self)
    }
  }
}
