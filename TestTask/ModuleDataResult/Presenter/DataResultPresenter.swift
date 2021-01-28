//
//  DataResultPresenter.swift
//  TestTask
//
//  Created by Денис Щиголев on 22.01.2021.
//

import UIKit

final class DataResultPresenter: DataResultPresenterProtocol {
    
    private weak var view: DataResultViewProtocol?
    private let networkService: NetworkServiceProtocol!
    private let router: DataResultRouterProtocol!
    private var sortedType = DataSortType.mostCommented
    private var cursor: String?
    private var entity: DataModel?
    private var items: [Item] = []
    
    var dataSource: UICollectionViewDiffableDataSource<DataResultSection, Item>?
    
    required init(view: DataResultViewProtocol,
                  networkService: NetworkServiceProtocol,
                  router: DataResultRouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }
    
    //MARK: getData
    func getData(isUpdate: Bool, complition: @escaping ()-> Void) {
        if isUpdate {
            items.removeAll()
        }
        let itemsCount = 5
        let stringLink = LinkGenerateService.shared.getMainLink(itemsCount: itemsCount,
                                                                cursor: isUpdate == true ? nil : cursor,
                                                                sortType: sortedType)
        networkService.createRequest(stringURL: stringLink) {[unowned self] result in
            switch result {
                
            case .success(let request):
                networkService.createDataTask(request: request) { (result: Result<DataModel, NetworkError>) in
                    switch result {
                    
                    case .success(let entity):
                        self.entity = entity
                        self.view?.isLoading = false
                        self.changeItems()
                        complition()
                    case .failure(let error):
                        DispatchQueue.main.async {
                            let errorText = error == NetworkError.badCursorInResponse ? cursor ?? "" : error.localizedDescription
                            let errorTitle = error == NetworkError.badCursorInResponse ? NetworkError.badCursorInResponse.localizedDescription : "Ошибка"
                            view?.showAlert(title: errorTitle, text: errorText)
                            complition()
                        }
                    }
                }
                
            case .failure(let error):
                view?.showAlert(title: "Ошибка", text: error.localizedDescription)
                complition()
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
        guard let dataSource = dataSource else { fatalError() }
        var snapshot = NSDiffableDataSourceSnapshot<DataResultSection, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        dataSource.apply(snapshot)
    }
    
    
    func showDetail(indexPath: IndexPath) {
        guard let item = entity?.data.items[indexPath.item] else { return }
        router.showDetailResult(selectedItem: item)
    }
    
    func changeSort(sortType: DataSortType) {
        self.sortedType = sortType
        getData(isUpdate: true, complition: { [weak self] in
            guard let entity = self?.entity,
                  entity.data.items.count > 0 else { return }
            self?.view?.collectionView?.scrollToItem(at: IndexPath(item: 0, section: 0),
                                                     at: .top, animated: true)
        })
    }
    
    private func changeItems() {
        guard let entity = entity else { return }
        cursor = entity.data.cursor
        items.append(contentsOf: entity.data.items)
        
        updateDataSource()
    }
}
