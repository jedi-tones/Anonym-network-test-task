//
//  Content.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import Foundation

struct Content: Decodable {
    let data: ContentData
    let type: BannerType
    let id: String?
}
