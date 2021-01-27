//
//  DataResultPresenter.swift
//  TestTask
//
//  Created by Денис Щиголев on 22.01.2021.
//

import UIKit

class DataResultPresenter: DataResultPresenterProtocol {
    
    weak var view: DataResultViewProtocol?
    let networkService: NetworkServiceProtocol!
    let router: DataResultRouterProtocol!
    
    var dataSource: UICollectionViewDiffableDataSource<DataResultSection, Item>?
    var entity: DataModel? {
        didSet{
            updateDataSource()
        }
    }
    
    required init(view: DataResultViewProtocol,
                  networkService: NetworkServiceProtocol,
                  router: DataResultRouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }
    
    //MARK: getData
    func getData() {
        let stringLink = Links.baseLink.rawValue
        networkService.createRequest(stringURL: stringLink) {[unowned self] result in
            switch result {
                
            case .success(let request):
                networkService.createDataTask(request: request) { (result: Result<DataModel, NetworkError>) in
                    switch result {
                    
                    case .success(let entity):
                        self.entity = entity
                    case .failure(let error):
                        DispatchQueue.main.async {
                            view?.showAlert(title: "Ошибка", text: error.localizedDescription)
                        }
                    }
                }
                
            case .failure(let error):
                view?.showAlert(title: "Ошибка", text: error.localizedDescription)
            }
        }
    }
    
    //MARK: setupDataSource
    func setupDataSource() {
        guard let view = view,
              let collectionView = view.collectionView else { fatalError() }
        
        dataSource = UICollectionViewDiffableDataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, element) -> UICollectionViewCell? in
                guard let section = DataResultSection(rawValue: indexPath.section) else { fatalError("Unknown section") }
                switch section {
                
                case .main:
                    guard
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DataResultCell.reuseID,
                                                                        for: indexPath) as? DataResultCell
                    else {
                        return UICollectionViewCell()
                    }
                    
                    cell.configure(item: element)
                    return cell
                }
            })
    }
    
    //MARK: updateDataSource
    func updateDataSource() {
        guard let entity = entity,
              let dataSource = dataSource else { fatalError() }
        var snapshot = NSDiffableDataSourceSnapshot<DataResultSection, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(entity.data.items, toSection: .main)
        dataSource.apply(snapshot)
    }
    
    
    func showDetail(indexPath: IndexPath) {
        print("ShowDetail \(indexPath.row)")
    }

}
