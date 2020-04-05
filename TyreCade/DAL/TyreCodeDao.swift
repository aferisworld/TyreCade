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
    
    
    public func delete(entityId: String) -> Promise<Bool> {
       return Promise { seal in
                guard let realm = try? Realm(), let actionObject = realm.object(ofType: TyreCodeEntity.self, forPrimaryKey: entityId) else {
                    
                    throw TCErrors.GenericError.TcError(error: "could not find tyre code")
                }
                
                try realm.write({
                     realm.delete(actionObject)
                })
                
               
                return seal.fulfill(true)
            }
    }
    
    
    static let shared = TyreCodeDao()
    
    public func save(entity: (code:String?, manufactureDate:Double?, expireDate:Double?)) -> Promise<TyreCodeModel> {
        return Promise {
            seal in
            let realm = try Realm()
            
            do {
                let tyreCodeEntity = try TyreCodeEntity(tuple: (code: entity.code, manufactureDate: entity.manufactureDate, expireDate: entity.expireDate))
             
            //Write to Realm
            try! realm.write {
                realm.add(tyreCodeEntity)
             }
                 
            let tyreCodeViewModel = TyreCodeModel(entity: tyreCodeEntity)
           
            
            seal.fulfill(tyreCodeViewModel)
            }catch {
                throw TCErrors.ValidationError.TcError(error: "Invalid object passed to save")
            }
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
            guard let tyrecode = try Realm().object(ofType: TyreCodeEntity.self, forPrimaryKey: id) else {
                throw TCErrors.GenericError.TcError(error: "No tyre code found with id \(id)")
            }
            seal.fulfill(TyreCodeModel(entity: tyrecode))
        }
    }
}
