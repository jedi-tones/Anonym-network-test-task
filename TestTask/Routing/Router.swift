//
//  Router.swift
//  TestTask
//
//  Created by Денис Щиголев on 22.01.2021.
//

import UIKit

class Router: DataResultRouterProtocol {
    var navigationController: UINavigationController?
    var moduleBuilder: ModuleBuilderProtocol?
    
    init(navigationController: UINavigationController?,
         moduleBuilder: ModuleBuilderProtocol?) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    func initialViewController() {
        guard let navigationController = navigationController,
              let moduleBuilder = moduleBuilder else { return }
        let viewController = moduleBuilder.createDataResultModule(router: self)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func popToRoot() {
        guard let navigationController = navigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }
    
    func showDetailResult() {
        guard let navigationController = navigationController,
              let moduleBuilder = moduleBuilder else { return }
        let viewController = moduleBuilder.createDetailResultModule(router: self)
        navigationController.pushViewController(viewController, animated: true)
    }
}
