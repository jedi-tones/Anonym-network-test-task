//
//  Statistics.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import Foundation

struct Statistics: Decodable {
    let likes, thanks: Int
    let uniqueName: Bool
    let thanksNextLevel: Int?
}
