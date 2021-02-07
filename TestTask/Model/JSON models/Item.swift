//
//  Item.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import Foundation

struct Item: Decodable, Hashable {
    
    let id: String
    let type: ItemType
    let contents: [Content]
    let createdAt: Int
    let author: Author?
//    let isCommentable, hasAdultContent, isAuthorHidden, isHiddenInProfile: Bool
//    let language: Language
//    let awards: Awards
//    let status: Status
//    let stats: Stats
//    let isMyFavorite: Bool
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(createdAt)
    }
}
