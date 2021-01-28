//
//  ViewController.swift
//  TestTask
//
//  Created by Денис Щиголев on 22.01.2021.
//

import UIKit

final class DataResultViewController: UIViewController, DataResultViewProtocol {
    
    private let refreshControl = UIRefreshControl()
    var isLoading = true
    var collectionView: UICollectionView?
    var presenter: DataResultPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupCollectionView()
        setupConstraints()
        
        presenter?.setupDataSource()
        presenter?.getData(isUpdate: true, complition: {})
    }
    
    private func setup() {
        navigationItem.title = "Anonym"
        let rightBarButtonItemImage = UIImage(systemName: "line.horizontal.3.decrease.circle")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarButtonItemImage,
                                                            style: UIBarButtonItem.Style.plain,
                                                            target: self,
                                                            action: #selector(filterTapped))
        view.backgroundColor = .myWhiteColor()
    }
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: setupCompositionLayout())
        collectionView?.delegate = self
        collectionView?.backgroundColor = .myBackgroundColor()
        collectionView?.register(DataResultCell.self,
                                 forCellWithReuseIdentifier: DataResultCell.reuseID)
        collectionView?.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    //MARK: setupCompositionLayout
    private func setupCompositionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
            guard let section = DataResultSection(rawValue: sectionIndex) else { fatalError("Unknown DataResult section")}
            
            switch section {
            case .main:
                return self?.setupMainSection()
            }
        }
        return layout
    }
    
    //MARK: setupMainSection
    private func setupMainSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .estimated(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitem: item,
                                                       count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8,
                                                        leading: 8,
                                                        bottom: 0,
                                                        trailing: 8)
        section.interGroupSpacing = 8
      
        return section
    }

    
    //MARK: showAlert
    func showAlert(title: String,
                   text: String) {
        let alertController = UIAlertController(title: title,
                                                message: text,
                                                preferredStyle: .alert)
        let alertOkButton = UIAlertAction(title: "Ok",
                                          style: .default,
                                          handler: nil)
        alertController.addAction(alertOkButton)
        present(alertController, animated: true, completion: nil)
    }
    
    //MARK: filterTapped
    @objc private func filterTapped() {
        let alertController = UIAlertController(title: "Сортировка постов",
                                                message: nil,
                                                preferredStyle: .actionSheet)
        
        alertController.view.tintColor = .myLabelColor()
        let alertHandler: ((DataSortType) -> Void) = {[weak self] sortType in
            self?.presenter?.changeSort(sortType: sortType)
        }
        
        let alertCreatedAtButton = UIAlertAction(title: DataSortType.createdAt.description(),
                                                 style: .default) { _ in
            alertHandler(DataSortType.createdAt)
        }
        let alertMostPopularButton = UIAlertAction(title: DataSortType.mostPopular.description(),
                                                   style: .default) { _ in
            alertHandler(DataSortType.mostPopular)
        }
        let alertMostCommentedButton = UIAlertAction(title: DataSortType.mostCommented.description(),
                                                     style: .default) { _ in
            alertHandler(DataSortType.mostCommented)
        }
        let alertCancelButton = UIAlertAction(title: "Отмена",
                                              style: .cancel,
                                          handler: nil)
        alertController.addAction(alertCreatedAtButton)
        alertController.addAction(alertMostPopularButton)
        alertController.addAction(alertMostCommentedButton)
        alertController.addAction(alertCancelButton)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func refreshData() {
        presenter?.getData(isUpdate: true, complition: { [weak self] in
            self?.refreshControl.endRefreshing()
        })
    }
}

//MARK: UICollectionViewDelegate
extension DataResultViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        presenter?.showDetail(indexPath: indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let bottomInsetToUpdate: CGFloat = 50
        guard isLoading == false,
              scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.frame.height + bottomInsetToUpdate)
        else { return }
        isLoading = true
        presenter?.getData(isUpdate: false, complition: {})
    }
}

//MARK: setupConstraints
extension DataResultViewController {
    private func setupConstraints() {
        guard let collectionView = collectionView else { return }
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
