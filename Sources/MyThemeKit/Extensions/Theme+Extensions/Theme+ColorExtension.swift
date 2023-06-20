//
//  Theme+ColorExtension.swift
//  
//
//  Created by RAGHAV SHARMA on 19/06/23.
//

import SwiftUI

public extension Theme {
    var headline1: ColorType {
        let uiColor = UIColor.headline1(theme: self)
        return ColorType(uiColor: uiColor)
    }
    var body: ColorType {
        let uiColor = UIColor.body(theme: self)
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
