//
//  Gender.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import Foundation

enum Gender: String, Decodable {
    case female = "FEMALE"
    case male = "MALE"
    case unset = "UNSET"
}
