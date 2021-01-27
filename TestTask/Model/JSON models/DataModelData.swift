//
//  DataModelData.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import Foundation

struct DataModelData: Decodable {
    let items: [Item]
    let cursor: String
}
