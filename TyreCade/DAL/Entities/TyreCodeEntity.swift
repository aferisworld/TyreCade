//
//  TyreCode.swift
//  TyreCade
//
//  Created by Nana Aferi on 02/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import RealmSwift
import SwiftyJSON

public class TyreCodeEntity: Object {
    @objc dynamic public var code: String? //tyre code
    let manufactureDate =  RealmOptional<Double>() // date tyre was manufactured
    let expireDate = RealmOptional<Double>() // expiration date of tyre
    
    public override static func primaryKey() -> String? {
        return "code"
    }
    
     convenience init(
        code: String,
        manufactureDate: Double,
        expireDate: Double
        ) {
        self.init()
        self.code = code
        self.manufactureDate.value = manufactureDate
        self.expireDate.value = expireDate
    }
     
    convenience init(tuple: (code: String?, manufactureDate: Double?, expireDate: Double?)) throws {
        guard let code = tuple.code, let manufactureDate = tuple.manufactureDate , let expireDate = tuple.expireDate else {
                   throw TCErrors.ValidationError.TcError(error: "Validation error")
         }
        
        self.init(code: code, manufactureDate: manufactureDate, expireDate: expireDate)
    }
    
}
