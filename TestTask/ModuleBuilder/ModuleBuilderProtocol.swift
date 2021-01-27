//
//  ModuleBuilderProtocol.swift
//  TestTask
//
//  Created by Денис Щиголев on 22.01.2021.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createDataResultModule(router: DataResultRouterProtocol) -> UIViewController
    func createDetailResultModule(router: DataResultRouterProtocol) -> UIViewController
}
