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
    
    public func save(entity: JSON) -> Promise<[PeriodModel]> {
        return Promise {
            seal in
            let realm = try Realm();
            //debugPrint("Period : the entity from the payload", entity)
            let periodEntities = entity["periods"].arrayValue ;
            
            var savableReportKeyObjects:[[String:String]] = [[String:String]]()
            
            let periodEntityModels: [PeriodModel] = try periodEntities.map {
                ent in
                if let entityDict = ent.dictionaryObject {
                    let periodEntity = try PeriodEntity(dict: entityDict);
                    try realm.write {
                        realm.add(periodEntity, update: true);
                    }
                  
                    
                    let oiViewModel = PeriodModel(entity: periodEntity);
                    
                    //update report keys locally
                    let oneSaveableReportKey =  self.getNewReportKeys(_period: String(oiViewModel.timestamp), reportType: oiViewModel.type, reportKey: oiViewModel.key, superareaId: oiViewModel.superareaId)
                    if oneSaveableReportKey.count > 0 {
                        savableReportKeyObjects.append(oneSaveableReportKey)
                    }
                    
                    
                    return oiViewModel;
                }
                throw OIErrors.ValidationError.OiError(error: "Invalid json passed to save")
            }
            
            //save new report keys found
            if savableReportKeyObjects.count > 0 {
                OIHelper.saveAccountReportsKeys(reportObjects: savableReportKeyObjects, isFromLogin: false)
            }
            
            //debugPrint("saved number of Period(s) : ", periodEntityModels.count);
            seal.fulfill(periodEntityModels)
        }
    }
    
    public func fetch(filter: FilterOptionsProtocol) -> Promise<[PeriodModel]> {
        return Promise<[PeriodModel]> {
            seal in
            let predicate = filter.getDAOSearchParams()
            let realm = try Realm();
            realm.refresh();
            
            let data = try Realm().objects(PeriodEntity.self).filter(predicate)
            let periodModels: [PeriodModel] = data.map {
                period in
                return PeriodModel(entity: period)
            }
            
            seal.fulfill(periodModels)
        }
    }
    
    public func get(id: String) -> Promise<PeriodModel> {
        return Promise<PeriodModel> {
            seal in
            guard let period = try Realm().object(ofType: PeriodEntity.self, forPrimaryKey: id) else {
                throw OIErrors.GenericError.OiError(error: "No period found with id \(id)")
            }
            seal.fulfill(PeriodModel(entity: period))
        }
    }
