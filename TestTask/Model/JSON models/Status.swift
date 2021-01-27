//
//  Status.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import Foundation

enum Status: String, Decodable {
    case deleted = "DELETED"
    case published = "PUBLISHED"
}
