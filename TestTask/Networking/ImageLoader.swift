//
//  ImageLoader.swift
//  TestTask
//
//  Created by Денис Щиголев on 28.01.2021.
//

import UIKit
import CoreImage

final class ImageLoader {
    static let shared = ImageLoader()
    private let cache = ImageCache()
    private let networkService = NetworkService()
    
    private init() {}
    
    func loadImage(from url: URL, complition: @escaping (Result<(UIImage?, URL), Error>) -> Void) {
        if let image = cache[url] {
            complition(.success((image, url)))
            return
        }
        
        networkService.createURLDataTask(url: url) {[weak self] result in
            switch result {
            
            case .success(let data):
                guard
                    let image = UIImage(data: data)
                else {
                    DispatchQueue.main.async {
                        complition(.success((nil, url)))
                    }
                    return
                }
                self?.cache[url] = image
                DispatchQueue.main.async {
                    complition(.success((image, url)))
                }
                
            case .failure(let error):
                complition(.failure(error))
            }
        }
    }
}

