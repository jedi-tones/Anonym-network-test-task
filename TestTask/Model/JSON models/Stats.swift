//
//  Stats.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import Foundation

struct Stats: Decodable {
    let likes, views, comments, shares: Comments
    let replies: Comments
    let timeLeftToSpace: TimeLeftToSpace
}
