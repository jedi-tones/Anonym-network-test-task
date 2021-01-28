//
//  PostDetailViewProtocol.swift
//  TestTask
//
//  Created by Денис Щиголев on 28.01.2021.
//

import UIKit

protocol PostDetailViewProtocol {
    func configure(authorName: String?, postText: String?, postTags: String?, postImage: UIImage?)
}
