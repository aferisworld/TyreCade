//
//  TyreCodeModel.swift
//  TyreCade
//
//  Created by Nana Aferi on 04/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation

public class TyreCodeModel  {
    
   public var code: String?
   public var formattedManufacturedDate:String?
   public var manufactureDate:Double?
   public var formattedExpireDate:String?
   public var expireDate:Double?
    
    init(code: String?, manufactureDate: Double?, expireDate: Double? ) {
        self.code = code
        self.manufactureDate = manufactureDate
        self.expireDate = expireDate
        self.formattedManufacturedDate = "12/12/1\(Int.random(in: 2015..<2020))"
        self.formattedExpireDate = "10/10/1\(Int.random(in: 2018..<2025))"
    }
    
    public convenience init(entity: TyreCodeEntity) { 
        self.init(
            code: entity.code,
            manufactureDate: entity.manufactureDate.value!,
            expireDate: entity.expireDate.value!)
        
       }
    
}
