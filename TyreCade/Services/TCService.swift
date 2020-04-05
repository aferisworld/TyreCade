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
 
    func save(content: Any) -> Promise<TyreCodeModel> {
        return self.daoClient.save(entity: content as! (code:String?, manufactureDate:Double?, expireDate:Double?))
    }
     
    public func fetch(filter: FilterOptionsProtocol, fetchType: FetchType) ->  Promise<[TyreCodeModel]> {
        let _filter = (filter as! TyreCadeFilterOptions)

        switch fetchType {
//        case .online:
//            return fetchFromApi(_filter)
        case .local:
            return self.daoClient.fetch(filter: _filter)
        default:
              return self.daoClient.fetch(filter: _filter)
        }
    }
    
}


