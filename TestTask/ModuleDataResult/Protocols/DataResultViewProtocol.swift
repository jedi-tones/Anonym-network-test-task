//
//  DataResultViewProtocol.swift
//  TestTask
//
//  Created by Денис Щиголев on 22.01.2021.
//

import UIKit

protocol DataResultViewProtocol: class {
    var collectionView: UICollectionView? { get set }
    var isLoading: Bool { get set }
    func showAlert(title: String, text: String)
}
