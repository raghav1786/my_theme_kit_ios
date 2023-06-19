//
//  UIColor+Extension.swift
//  
//
//  Created by RAGHAV SHARMA on 19/06/23.
//

import UIKit

extension UIColor {
    static func blue(theme: Theme) -> UIColor {
        let assetName = UIColor.assetName("blue",
                                          theme: theme)
        return UIColor(named: assetName, in: .module, compatibleWith: nil) ?? .clear
    }
    
    static func red(theme: Theme) -> UIColor {
        let assetName = UIColor.assetName("red",
                                          theme: theme)
        return UIColor(named: assetName, in: .module, compatibleWith: nil) ?? .clear
    }
    
    static func assetName(_ name: String, theme: Theme) -> String {
        return "\(theme)/"+name
    }
}
