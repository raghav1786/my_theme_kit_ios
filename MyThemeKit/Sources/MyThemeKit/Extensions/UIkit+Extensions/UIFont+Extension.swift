
//
// UIFont + Extension.swift
//
// Copyright (c) 2021 Amway. All rights reserved.
//

import UIKit

// MARK: RegisterFonts

extension UIFont {
  static func registerFont(_ name: String, fileExtension: String) {
    guard let fontURL = Bundle.module.url(forResource: name,
                                          withExtension: fileExtension) else {
      return
    }
    var error: Unmanaged<CFError>?
    CTFontManagerRegisterFontsForURL(fontURL as CFURL,
                                     .process, &error)
  }
}
