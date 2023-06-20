//
//  FontFamily.swift
//  
//
//  Created by RAGHAV SHARMA on 19/06/23.
//

import UIKit

enum FontFamily {
    case headline1(theme: Theme)
    case body(theme: Theme)
}

extension FontFamily {
  private enum FontStyle: String {
    case bold = "-Bold"
    case regular = "-Regular"
    case medium = "-Medium"
  }
  static func registerFonts(fontName: String) {
    UIFont.registerFont(fontName + FontStyle.bold.rawValue,
              fileExtension: "ttf")
    UIFont.registerFont(fontName + FontStyle.medium.rawValue,
              fileExtension: "ttf")
    UIFont.registerFont(fontName + FontStyle.regular.rawValue,
              fileExtension: "ttf")
  }
}

extension FontFamily {
  @discardableResult static func fontName(theme: Theme) -> String {
    switch theme {
    case .market1:
      return "GTWalsheimPro"
    case .market2:
      return ""
    }
  }
}

extension FontFamily {
    typealias FontConfiguration = (fontType: String,
                                   pointSize: CGFloat,
                                   lineHeight: CGFloat,
                                   textStyle: UIFont.TextStyle)
    var configuration: FontConfiguration {
        let configuration: FontConfiguration
        switch self {
        case let .headline1(theme):
            configuration = (FontFamily.fontName(theme: theme) + FontStyle.bold.rawValue, 49.0, 56.0, .headline)
        case let .body(theme):
            configuration = (FontFamily.fontName(theme: theme) + FontStyle.medium.rawValue, 18.0, 24.0, .body)
        }
        return configuration
    }
        
        var font: UIFont {
            UIFont(name: configuration.fontType,
                   size: configuration.pointSize) ?? .systemFont(ofSize: configuration.pointSize)
        }
        var lineHeight: CGFloat {
            configuration.lineHeight
        }
}
