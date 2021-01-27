//
//  BannerType.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import Foundation

enum BannerType: String, Decodable {
    case image = "IMAGE"
    case tags = "TAGS"
    case text = "TEXT"
}
