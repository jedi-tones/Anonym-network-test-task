//
//  DataResultPresenterProtocol.swift
//  TestTask
//
//  Created by Денис Щиголев on 22.01.2021.
//

import UIKit

protocol DataResultPresenterProtocol {
    init(view: DataResultViewProtocol,
         networkService: NetworkServiceProtocol,
         router: DataResultRouterProtocol)
    
    var dataSource: UICollectionViewDiffableDataSource<DataResultSection, Item>? { get set }
    func getData()
    func setupDataSource()
    func updateDataSource()
    func showDetail(indexPath: IndexPath)
}
