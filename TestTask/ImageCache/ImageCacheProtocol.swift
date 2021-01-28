//
//  ImageCacheProtocol.swift
//  TestTask
//
//  Created by Денис Щиголев on 28.01.2021.
//

import UIKit

protocol ImageCacheProtocol: class {
    subscript(_ url: URL) -> UIImage? { get set }
    
    func image(for url: URL) -> UIImage?
    func insertImage(_ image: UIImage?, for url: URL)
    func removeImage(for url: URL)
    func removeAllImages()
}
