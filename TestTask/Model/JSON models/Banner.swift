//
//  Banner.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import Foundation

struct Banner: Decodable {
    let type: BannerType
    let id: String
    let data: BannerData
}
