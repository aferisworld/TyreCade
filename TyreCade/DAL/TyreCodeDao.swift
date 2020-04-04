//
//  TyreCodeDao.swift
//  TyreCade
//
//  Created by Nana Aferi on 04/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON
import PromiseKit

public class TyreCodeDao: TCDAOProtocol {
    
    static let shared = TyreCodeDao()
    
    public func save(entity: (code:String, manufactureDate:Int64,expireDate:Int64?)) -> Promise<TyreCodeModel> {
        return Promise {
            seal in
            let realm = try Realm()
            
     
            let tyreCodeEntity = try TyreCodeEntity(code: entity.code, manufactureDate: entity.manufactureDate, expireDate: entity.expireDate)
            
            //Write to Realm
            try realm.write {
                realm.add(tyreCodeEntity, update: .all)
            }
                  
           let tyreCodeViewModel = TyreCodeModel(entity: tyreCodeEntity)
           
            //throw OIErrors.ValidationError.OiError(error: "Invalid object passed to save")
           
            seal.fulfill(tyreCodeViewModel)
        }
    }
    
    public func fetch(filter: FilterOptionsProtocol) -> Promise<[TyreCodeModel]> {
        return Promise<[TyreCodeModel]> {
            seal in
            let predicate = filter.getDAOSearchParams()
            let realm = try Realm()
            realm.refresh()
            
            let data = try Realm().objects(TyreCodeEntity.self).filter(predicate)
            let tyreCodeModels: [TyreCodeModel] = data.map {
                tyrecode in
                return TyreCodeModel(entity: tyrecode)
            }
            
            seal.fulfill(tyreCodeModels)
        }
    }
    
    public func get(id: String) -> Promise<TyreCodeModel> {
        return Promise<TyreCodeModel> {
            seal in
            guard let period = try Realm().object(ofType: TyreCodeEntity.self, forPrimaryKey: id) else {
                throw OIErrors.GenericError.OiError(error: "No period found with id \(id)")
            }
            seal.fulfill(PeriodModel(entity: period))
        }
    }
