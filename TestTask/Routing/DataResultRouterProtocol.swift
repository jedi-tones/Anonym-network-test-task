//
//  DataResultRouterProtocol.swift
//  TestTask
//
//  Created by Денис Щиголев on 22.01.2021.
//

import Foundation

protocol DataResultRouterProtocol: MainRouterProtocol {
    func initialViewController()
    func popToRoot()
    func showDetailResult()
}
