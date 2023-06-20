//
//  UIColor+Extension.swift
//  
//
//  Created by RAGHAV SHARMA on 19/06/23.
//

import UIKit

extension UIColor {
    static func headline1(theme: Theme) -> UIColor {
        let assetName = UIColor.assetName("headline1",
                                          theme: theme)
        return UIColor(named: assetName, in: .module, compatibleWith: nil) ?? .clear
    }
    
    static func body(theme: Theme) -> UIColor {
        let assetName = UIColor.assetName("body",
                                          theme: theme)
        return UIColor(named: assetName, in: .module, compatibleWith: nil) ?? .clear
    }
    
    static func assetName(_ name: String, theme: Theme) -> String {
        return "\(theme)/"+name
    }
}
