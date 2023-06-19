//
//  Theme+FontExtension.swift
//  
//
//  Created by RAGHAV SHARMA on 19/06/23.
//

import SwiftUI

public extension Theme {
  var headline1: FontStyle {
    let fontStyle = FontFamily.headline1(theme: self)
      return FontStyle(uiFont: fontStyle.font,
                       lineHeight: fontStyle.lineHeight)
  }
}

// MARK: FontStyle provides support for UIColor and Color

public struct FontStyle {
  public private(set) var uiFont: UIFont
  public var font: Font {
    return uiFont.suiFont
  }
  public var lineHeight: CGFloat
}

// MARK: UIFont to Font
extension UIFont {
  var suiFont: Font {
    Font(self as CTFont)
  }
}
