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
    let isCommentable, hasAdultContent, isAuthorHidden, isHiddenInProfile: Bool
    let contents: [Content]
    let language: Language
    let awards: Awards
    let createdAt, updatedAt: Int
    let status: Status
    let author: Author?
    let stats: Stats
    let isMyFavorite: Bool
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(createdAt)
    }
}
