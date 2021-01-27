//
//  UIColor+Extension.swift
//  TestTask
//
//  Created by Денис Щиголев on 25.01.2021.
//

import UIKit

extension UIColor {
    static func dynamicColor(dark: UIColor, light: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return light }
       
        return UIColor {
            $0.userInterfaceStyle == .dark ? dark : light
        }
    }
    
    static func myWhiteColor() -> UIColor {
        dynamicColor(dark: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), light: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    }
    
    static func myBackgroundColor() -> UIColor {
        dynamicColor(dark: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), light: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    }
    
    static func myLabelColor() -> UIColor {
        dynamicColor(dark: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), light: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    }
}
