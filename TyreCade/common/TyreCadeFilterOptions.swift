//
//  TyreCadeFilterOptions.swift
//  TyreCade
//
//  Created by Nana Aferi on 04/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation
import RealmSwift

class TyreCadeFilterOptions: FilterOptionsProtocol {
    
    
    required public init() {
    }
    
    public func getDAOSearchParams() -> String {
        //Create query predicate here 
        return ""
    }
    
    public func getAPISearchParams() -> [String: Any]{
        return [:]
    }
     
}

