//
//  TCDAOProtocol.swift
//  TyreCade
//
//  Created by Nana Aferi on 04/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON

public protocol TCDAOProtocol {
    associatedtype U
    associatedtype V
    associatedtype DaoModelType
    
    func save(entity: U) -> Promise<V>
    func fetch(filter: FilterOptionsProtocol) -> Promise<[DaoModelType]>
    func get(id: String) -> Promise<DaoModelType>
    func delete(entityId: String) -> Promise<Bool>
} 
