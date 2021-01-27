//
//  NavigationService.swift
//  TestTask
//
//  Created by Денис Щиголев on 25.01.2021.
//

import UIKit

final class NavigationService {
    static let shared = NavigationService()
    
    private init() { }
    
    func generateNavigationController(image: UIImage?,
                                      title: String?,
                                      tag: Int,
                                      isHidden: Bool = false) -> UINavigationController {
        
        let navController = UINavigationController()
        navController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        navController.tabBarItem.image = image
        navController.tabBarItem.tag = tag
        navController.navigationItem.title = title
        navController.navigationBar.isHidden = isHidden
        
        let appereance = navController.navigationBar.standardAppearance.copy()
        appereance.shadowImage = UIImage()
        appereance.shadowColor = .clear
        appereance.backgroundImage = UIImage()
        appereance.backgroundColor = .myWhiteColor()
        
        navController.navigationBar.standardAppearance = appereance
        navController.navigationBar.prefersLargeTitles = false
        navController.navigationBar.tintColor = .myLabelColor()
        
        navController.navigationBar.titleTextAttributes = [.font: UIFont.avenirBold(size: 16)]
        navController.navigationBar.largeTitleTextAttributes = [.font: UIFont.avenirBold(size: 38)]
        return navController
    }
}
