//
//  NetworkService.swift
//  TestTask
//
//  Created by Денис Щиголев on 22.01.2021.
//

import Foundation

final class NetworkService: NetworkServiceProtocol {
    func createRequest(stringURL: String, complition: @escaping (Result<URLRequest, NetworkError>) -> Void) {
        
        guard let URL = URL(string: stringURL) else {
            complition(.failure(.incorrectURL))
            return
        }
        let request = URLRequest(url: URL)
        complition(.success(request))
    }
    
}

