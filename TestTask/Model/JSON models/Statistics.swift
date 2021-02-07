//
//  Statistics.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import Foundation

struct Statistics: Decodable {
    let likes: Int
    let thanks: Double
    let uniqueName: Bool
    let thanksNextLevel: Int?
}
