//
//  UIFont+Extension.swift
//  TestTask
//
//  Created by Денис Щиголев on 25.01.2021.
//

import UIKit

extension UIFont {
    
    static func avenirBold(size: CGFloat) -> UIFont {
        guard let font = UIFont.init(name: "AvenirNext-Bold", size: size) else { fatalError("Unknown Font")}

        return font
    }
    
    static func avenirRegular(size: CGFloat) -> UIFont {
        guard let font = UIFont.init(name: "AvenirNext-Regular", size: size) else { fatalError("Unknown Font")}

        return font
    }
    
    static func avenirUltraLight(size: CGFloat) -> UIFont {
        guard let font = UIFont.init(name: "AvenirNext-UltraLight", size: size) else { fatalError("Unknown Font")}

        return font
    }
    
    static func avenirHeavy(size: CGFloat) -> UIFont {
        guard let font = UIFont.init(name: "AvenirNext-Heavy", size: size) else { fatalError("Unknown Font")}

        return font
    }
}
