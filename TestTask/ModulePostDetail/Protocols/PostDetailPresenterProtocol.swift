//
//  PostDetailProtocol.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import UIKit

protocol PostDetailPresenterProtocol {
    var postImage: UIImage? { get set }
    var postText: String? { get set }
    var authorName: String? { get set }
    var postTags: String? { get set }
    init(view: PostDetailViewProtocol, selectedItem: Item)
}
