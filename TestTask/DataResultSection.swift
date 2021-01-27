//
//  DataResultSection.swift
//  TestTask
//
//  Created by Денис Щиголев on 22.01.2021.
//

import Foundation

enum DataResultSection: Int, CaseIterable {
    case main
    
    func description() -> String {
        switch self {
        case .main:
            return "Главная"
        }
    }
}
