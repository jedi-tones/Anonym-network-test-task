//
//  NetworkService.swift
//  TestTask
//
//  Created by Денис Щиголев on 22.01.2021.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    func createRequest(stringURL: String, complition: @escaping (Result<URLRequest, NetworkError>) -> Void) {
        
        guard let URL = URL(string: stringURL) else {
            complition(.failure(.incorrectURL))
            return
        }
        let request = URLRequest(url: URL)
        complition(.success(request))
    }
    
    func createPostRequest(stringURL: String,
                           parametrs: [String: String],
                           complition: @escaping (Result<URLRequest, NetworkError>) -> Void) {
        
        guard let URL = URL(string: stringURL) else {
            complition(.failure(.incorrectURL))
            return
        }
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        if let httpBody = try? JSONSerialization.data(withJSONObject: parametrs, options: []) {
            request.httpBody = httpBody
        }
        
        complition(.success(request))
    }
}

