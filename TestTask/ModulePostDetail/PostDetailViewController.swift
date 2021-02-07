//
//  PostDetailViewController.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import UIKit

final class PostDetailViewController: UIViewController, PostDetailViewControllerProtocol {
    
    var presenter: PostDetailPresenterProtocol?
    override func loadView() {
        super.loadView()
        view = PostDetailView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupData()
    }
    
    //MARK: setupData
    func setupData() {
        guard let presenter = presenter,
              let view = view as? PostDetailViewProtocol
        else { return }
        view.configure(authorName: presenter.authorName,
                       postText: presenter.postText,
                       postTags: presenter.postTags,
                       postImage: presenter.postImage)
        self.view.layoutIfNeeded()
    }
}
