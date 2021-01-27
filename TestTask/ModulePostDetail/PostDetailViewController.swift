//
//  PostDetailViewController.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import UIKit

class PostDetailViewController: UIViewController, PostDetailViewProtocol {
    
    private let scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIScrollView())
    
    private let authorName: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
        $0.font = .avenirBold(size: 16)
        $0.textColor = .myLabelColor()
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private let postText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.font = .avenirRegular(size: 14)
        $0.textColor = .myLabelColor()
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private let postTags: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.font = .avenirBold(size: 14)
        $0.textColor = .myLabelColor()
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private let postImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    var presenter: PostDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        setupData()
    }
    
    //MARK: setup
    private func setup() {
        scrollView.backgroundColor = .myWhiteColor()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
    }
    
    //MARK: setupData
    private func setupData() {
        guard let presenter = presenter else { return }
        authorName.text = presenter.authorName
        postText.text = presenter.postText
        postTags.text = presenter.postTags
        postImage.image = presenter.postImage
    }
}

//MARK: setupConstraints
extension PostDetailViewController {
    private func setupConstraints() {
        view.addSubview(scrollView)
        scrollView.addSubview(authorName)
        scrollView.addSubview(postText)
        scrollView.addSubview(postTags)
        scrollView.addSubview(postImage)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            authorName.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            authorName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            postText.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 10),
            postText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            postText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            postTags.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 10),
            postTags.leadingAnchor.constraint(equalTo: postText.leadingAnchor),
            postTags.trailingAnchor.constraint(equalTo: postText.trailingAnchor),
            
            postImage.topAnchor.constraint(equalTo: postTags.bottomAnchor, constant: 10),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
            postImage.leadingAnchor.constraint(equalTo: postText.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: postText.trailingAnchor)
        ])
    }
}
