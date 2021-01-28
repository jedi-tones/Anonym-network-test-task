//
//  PostDetailView.swift
//  TestTask
//
//  Created by Денис Щиголев on 28.01.2021.
//

import UIKit

class PostDetailView: UIView {
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
        $0.layer.cornerRadius = CGFloat(DefaultLayerValue.cornerRadius.rawValue)
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    init() {
        super.init(frame: .zero)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: setup
    private func setup() {
        scrollView.backgroundColor = .myWhiteColor()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.updateContentView()
    }
    
    //MARK: setupConstraints
    private func setupConstraints() {
        addSubview(scrollView)
        scrollView.addSubview(authorName)
        scrollView.addSubview(postText)
        scrollView.addSubview(postTags)
        scrollView.addSubview(postImage)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            authorName.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            authorName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            postText.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 10),
            postText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            postText.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            postTags.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 10),
            postTags.leadingAnchor.constraint(equalTo: postText.leadingAnchor),
            postTags.trailingAnchor.constraint(equalTo: postText.trailingAnchor),
            
            postImage.topAnchor.constraint(equalTo: postTags.bottomAnchor, constant: 10),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
            postImage.leadingAnchor.constraint(equalTo: postText.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: postText.trailingAnchor)
        ])
    }
    
}
//MARK: PostDetailViewProtocol
extension PostDetailView: PostDetailViewProtocol {
    func configure(authorName: String?, postText: String?, postTags: String?, postImage: UIImage?) {
        self.authorName.text = authorName
        self.postText.text = postText
        self.postTags.text = postTags
        self.postImage.image = postImage
    }
}
