//
//  UIScrollView+Extension.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import UIKit

extension UIScrollView {
    func updateContentView(bottomOffset: CGFloat = 0) {
        let bottomOffset:CGFloat = bottomOffset
        if let maxY = subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY {
            contentSize.height = maxY + bottomOffset
            print(contentSize.height)
        }
    }
}
