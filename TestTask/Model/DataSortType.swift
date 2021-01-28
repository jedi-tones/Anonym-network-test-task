//
//  DataSorting.swift
//  TestTask
//
//  Created by Денис Щиголев on 28.01.2021.
//

import Foundation

enum DataSortType: String {
    case mostPopular
    case mostCommented
    case createdAt
}

extension DataSortType {
    func description() -> String {
        switch self {
        
        case .mostPopular:
            return "Популярные"
        case .mostCommented:
            return "Комментируемые"
        case .createdAt:
            return "По дате создания"
        }
    }
}
