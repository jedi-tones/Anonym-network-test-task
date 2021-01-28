//
//  PostDetailPresenter.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import UIKit

final class PostDetailPresenter: PostDetailPresenterProtocol {
    
    private weak var view: PostDetailViewProtocol?
    private var item: Item
    
    var postImage: UIImage?
    var postText: String?
    var postTags: String?
    var authorName: String?
    
    required init(view: PostDetailViewProtocol, selectedItem: Item) {
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
                if let _ = content.data.original?.url {
                    postImage = UIImage(systemName: "person",
                                              withConfiguration: UIImage.SymbolConfiguration(weight: .heavy))
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
