//
//  ContentData.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import Foundation

struct ContentData: Decodable {
    let value: String?
    let extraSmall, small, medium, original: ImageData?
    let values: [String]?
}
