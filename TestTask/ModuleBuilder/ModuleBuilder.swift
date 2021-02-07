//
//  ModuleBuilder.swift
//  TestTask
//
//  Created by Денис Щиголев on 22.01.2021.
//

import UIKit

class ModuleBuilder: ModuleBuilderProtocol {
    func createDataResultModule(router: DataResultRouterProtocol) -> UIViewController {
        let networkService = NetworkService()
        let viewController = DataResultViewController()
        let presenter = DataResultPresenter(view: viewController,
                                            networkService: networkService,
                                            router: router)
        viewController.presenter = presenter
        
        return viewController
    }
    
    func createDetailResultModule(router: DataResultRouterProtocol, selectedItem: Item) -> UIViewController {
        let viewController = PostDetailViewController()
        let presenter = PostDetailPresenter(view: viewController,
                                            selectedItem: selectedItem)
        viewController.presenter = presenter
        
        return viewController
    }
}
