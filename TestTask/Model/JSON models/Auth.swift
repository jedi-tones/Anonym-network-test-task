//
//  Auth.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import Foundation

struct Auth: Decodable {
    let isDisabled: Bool?
    let level, lastSeenAt: Int?
}
