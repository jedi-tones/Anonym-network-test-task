//
//  DataResultCell.swift
//  TestTask
//
//  Created by Денис Щиголев on 27.01.2021.
//

import UIKit

class DataResultCell: UICollectionViewCell, ReuseCellProtocol {
    static let reuseID = "DataResultCell"
    
    private let authorName: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
        $0.font = .avenirBold(size: 16)
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private let postText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 5
        $0.font = .avenirRegular(size: 14)
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private let postImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.backgroundColor = .myWhiteColor()
        contentView.layer.cornerRadius = CGFloat(DefaultLayerValue.cornerRadius.rawValue)
    }
    
    func configure(item: Item) {
        
        //setup author name
        if let author = item.author {
            authorName.text = author.name
        } else {
            authorName.text = "Anon"
        }
        
        //setup main content data
        item.contents.forEach { content in
            switch content.type {
            
            case .image:
                if let _ = content.data.original?.url {
                    postImage.image = UIImage(systemName: "person",
                                              withConfiguration: UIImage.SymbolConfiguration(weight: .heavy))
                }
            case .tags:
                break
            case .text:
                if let text = content.data.value {
                    postText.text = text
                }
            }
        }
        
    }
    
    private func setupConstraints(){
        contentView.addSubview(authorName)
        contentView.addSubview(postText)
        contentView.addSubview(postImage)
        
        NSLayoutConstraint.activate([
            authorName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            authorName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            postText.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 10),
            postText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            postText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            postImage.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 10),
            postImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
            postImage.leadingAnchor.constraint(equalTo: postText.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: postText.trailingAnchor)
        ])
    }
}
