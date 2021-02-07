//
//  Box.swift
//  TestTask
//
//  Created by Денис Щиголев on 08.02.2021.
//

import Foundation

class Box <T>{
    typealias Listner = (T) -> Void
    
    var listner: Listner?
    var value: T {
        didSet {
            listner?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(listner: @escaping Listner) {
        self.listner = listner
        self.listner?(value)
    }
}
