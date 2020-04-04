//
//  TCService.swift
//  TyreCade
//
//  Created by Nana Aferi on 04/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON

public class TCService: TCServiceProtocol {
   
    public static let shared = TCService(daoProtocol: TyreCodeDao.shared)
     
    private var daoClient: TyreCodeDao
    
    public required init(daoProtocol: TyreCodeDao) {
        self.daoClient = daoProtocol
    }
 
    func save(content: Any) -> Promise<SummaryModel> {
        return self.daoClient.save(entity: JSON(content))
    }
    
//    fileprivate func fetchFromApi(_ filter: SummaryFilterOptions) -> Promise<SummaryModel> {
//        return self.apiClient.fetch(filter: filter).then({
//                (json) -> Promise<SummaryModel> in
//                debugPrint("the json from fetchFromAPi __ ")
//                debugPrint(json)
//                return self.daoClient.save(entity: JSON(json))
//            })
//    }
//
//    public func fetch(filter: FilterOptionsProtocol, fetchType: FetchType) ->  Promise<SummaryModel> {
//        let _filter = (filter as! SummaryFilterOptions).copy() as! SummaryFilterOptions
//
//        switch fetchType {
//        case .online:
//            return fetchFromApi(_filter)
//        case .local:
//            return self.daoClient.fetch(filter: _filter)
//        default:
//            return fetchFromApi(_filter)
//        }
//    }
    
}


