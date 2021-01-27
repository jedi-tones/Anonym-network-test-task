//
//  ReuseCell.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import Foundation

protocol ReuseCellProtocol {
    static var reuseID: String { get }
    func configure(item: Item)
}
