//
//  TCServicesProtocol.swift
//  TyreCade
//
//  Created by Nana Aferi on 04/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON

public enum FetchType {
    case local
    case online
}

protocol TCServiceProtocol {
    associatedtype FetchModelType
    associatedtype SaveModelType
    associatedtype FilterType
    associatedtype ContentType
    
    func fetch(filter: FilterType, fetchType: FetchType) -> Promise<FetchModelType>
    func save(content: ContentType) -> Promise<SaveModelType>
}
