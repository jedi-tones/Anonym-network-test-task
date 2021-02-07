//
//  PostDetailPresenter.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import UIKit

final class PostDetailPresenter: PostDetailPresenterProtocol {
    
    private weak var view: PostDetailViewControllerProtocol?
    private var item: Item
    
    var postImage: UIImage? {
        didSet {
            view?.setupData()
        }
    }
    var postText: String?
    var postTags: String?
    var authorName: String?
    
    required init(view: PostDetailViewControllerProtocol, selectedItem: Item) {
        self.view = view
        self.item = selectedItem
        setupModelsData()
    }
    
    private func setupModelsData() {
        //setup author name
        if let author = item.author {
            authorName = author.name
        } else {
            authorName = "Anon"
        }
        
        //setup main content data
        item.contents.forEach { content in
            switch content.type {
            
            case .image:
                if let stringURL = content.data.original?.url,
                   let url = URL(string: stringURL) {
                    ImageLoader.shared.loadImage(from: url) { [weak self] result in
                        switch result {
                        
                        case .success(let imageTuple):
                            if let image = imageTuple.0 {
                                self?.postImage = image
                            } else {
                                self?.postImage = UIImage(systemName: "photo")?.withTintColor(.myLabelColor())
                            }
                        case .failure(_):
                            break
                        }
                    }
                }
            case .tags:
                if let tags = content.data.values {
                    postTags = tags.joined(separator: ", ")
                }
            case .text:
                if let text = content.data.value {
                    postText = text
                }
            }
        }
    }
}
