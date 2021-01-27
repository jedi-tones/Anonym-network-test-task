//
//  Author.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import Foundation

struct Author: Decodable {
    let id: String
    let name: String
    let banner, photo: Banner?
    let gender: Gender
    let isHidden, isBlocked, isMessagingAllowed: Bool
    let auth: Auth
    let statistics: Statistics
    let tagline: String
    let data: AuthorData
}
