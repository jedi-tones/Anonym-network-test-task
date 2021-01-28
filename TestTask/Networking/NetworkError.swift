//
//  NetworkError.swift
//  TestTask
//
//  Created by Денис Щиголев on 22.01.2021.
//

import Foundation

enum NetworkError: Error {
    case invalidData
    case parsingJSONFail
    case requestFail
    case incorrectURL
    case badCursorInResponse
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        
        case .invalidData:
            return NSLocalizedString("Ошибка получения данных", comment: "")
        case .parsingJSONFail:
            return NSLocalizedString("Ошибка JSON", comment: "")
        case .requestFail:
            return NSLocalizedString("Ошибка запроса", comment: "")
        case .badCursorInResponse:
            return NSLocalizedString("Некорректный курсор в ответе", comment: "")
        case .incorrectURL:
            return NSLocalizedString("Некорректный URL", comment: "")
        }
    }
}
