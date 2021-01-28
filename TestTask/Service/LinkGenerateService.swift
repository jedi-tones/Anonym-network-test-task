//
//  LinkGenerateService.swift
//  TestTask
//
//  Created by Денис Щиголев on 28.01.2021.
//

import Foundation

final class LinkGenerateService {
    static let shared = LinkGenerateService()
    private init() {}
    
    func getMainLink(itemsCount:Int, cursor: String?, sortType: DataSortType) -> String {
        
        let link = Links.baseLink.rawValue +
            "?\(GetRequestParametrs.first.rawValue)=\(itemsCount)" +
            "&\(GetRequestParametrs.after.rawValue)=\(cursor ?? "")" +
            "&\(GetRequestParametrs.orderBy.rawValue)=\(sortType.rawValue)"
        print(link)
        return link
    }
}
