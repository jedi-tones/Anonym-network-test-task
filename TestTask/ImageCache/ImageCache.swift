//
//  ImageCache.swift
//  TestTask
//
//  Created by Денис Щиголев on 28.01.2021.
//

import UIKit

final class ImageCache {

    private lazy var imageCache: NSCache<AnyObject, AnyObject> = {
        let cache = NSCache<AnyObject, AnyObject>()
        cache.countLimit = config.countLimit
        return cache
    }()
    private let lock = NSLock()
    private let config: Config

    struct Config {
        let countLimit: Int

        static let defaultConfig = Config(countLimit: 100)
    }

    init(config: Config = Config.defaultConfig) {
        self.config = config
    }
}

extension ImageCache: ImageCacheProtocol {
    subscript(url: URL) -> UIImage? {
        get {
            return image(for: url)
        }
        set {
            return insertImage(newValue, for: url)
        }
    }
    
    func image(for url: URL) -> UIImage? {
            lock.lock(); defer { lock.unlock() }
            
            if let image = imageCache.object(forKey: url as AnyObject) as? UIImage {
                return image
            }
            return nil
        }
    
    func removeAllImages() {
        imageCache.removeAllObjects()
    }
    
    func insertImage(_ image: UIImage?, for url: URL) {
        guard let image = image else { return removeImage(for: url) }

        lock.lock(); defer { lock.unlock() }
        imageCache.setObject(image, forKey: url as AnyObject)
    }

    func removeImage(for url: URL) {
        lock.lock(); defer { lock.unlock() }
        imageCache.removeObject(forKey: url as AnyObject)
    }
}
