//
//  NetworkServiceProtocol.swift
//  TestTask
//
//  Created by Денис Щиголев on 22.01.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func createRequest(stringURL: String, complition: @escaping (Result<URLRequest, NetworkError>) -> Void)
    func createPostRequest(stringURL: String,
                           parametrs: [String: String],
                           complition: @escaping (Result<URLRequest, NetworkError>) -> Void)
    func createDataTask<T:Decodable>(request: URLRequest, complition: @escaping (Result<T, NetworkError>) -> Void)
}

extension NetworkServiceProtocol {
    private func decodingData<T: Decodable>(request: URLRequest,
                                            decodingType: T.Type?,
                                            complition: @escaping (Result<T, NetworkError>) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let response = response as? HTTPURLResponse else {
                complition(.failure(.requestFail))
                return
            }
           
           
            switch response.statusCode {
            case 200:
                guard let data = data else {
                    complition(.failure(.invalidData))
                    return
                }
                guard let decoding = decodingType else {
                    complition(.failure(.invalidData))
                    return
                }
                do {
                    let entity = try JSONDecoder().decode(decoding, from: data)
                    DispatchQueue.main.async {
                        complition(.success(entity))
                    }
                } catch {
                    complition(.failure(.parsingJSONFail))
                }
                
            case 300:
                complition(.failure(.requestFail))
            case 400:
                complition(.failure(.requestFail))
            case 500:
                complition(.failure(.requestFail))
            default:
                complition(.failure(.requestFail))
                
            }
        }
    }
    
    func createDataTask<T:Decodable>(request: URLRequest, complition: @escaping (Result<T, NetworkError>) -> Void) {
        decodingData(request: request,
                     decodingType: T.self,
                     complition: complition).resume()
    }
}
