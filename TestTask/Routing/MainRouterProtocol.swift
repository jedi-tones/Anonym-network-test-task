//
//  MainRouterProtocol.swift
//  TestTask
//
//  Created by Денис Щиголев on 22.01.2021.
//

import UIKit

protocol MainRouterProtocol {
    var navigationController: UINavigationController? { get set }
    var moduleBuilder: ModuleBuilderProtocol? { get set }
}
