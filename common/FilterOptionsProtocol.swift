//
//  FilterOptionsProtocol.swift
//  TyreCade
//
//  Created by Nana Aferi on 04/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation

public protocol FilterOptionsProtocol {
    
     
    func getDAOSearchParams () -> String
    func getAPISearchParams () -> [String:Any]

    func getRoute() -> String
}

extension FilterOptionsProtocol {
    public func getRoute () -> String { return ""; }
}
