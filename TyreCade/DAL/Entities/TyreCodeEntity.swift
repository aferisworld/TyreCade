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
    dynamic public var code: String? //tyre code
    let manufactureDate =  RealmOptional<Int64>() // date tyre was manufactured
    let expireDate = RealmOptional<Int64>() // expiration date of tyre
    
    public override static func primaryKey() -> String?
    {
        return "code"
    }
    
     convenience init(
        code: String?,
        manufactureDate: Int64?,
        expireDate: Int64?
        ) {
        self.init()
        self.code = code
        self.manufactureDate.value = manufactureDate
        self.expireDate.value = expireDate
    }  
    
}
