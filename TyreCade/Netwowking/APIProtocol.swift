//
//  APIProtocol.swift
//  TyreCade
//
//  Created by Nana Aferi on 06/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON

protocol APIProtocol {
    associatedtype FilterType
    associatedtype ModelType
    
    var tyRequestClient: Alamofire.SessionManager { get }
    init(apiBase: String, tyRequestClient: Alamofire.SessionManager)
    func fetch(filter: FilterType) -> Promise<ModelType>
    func post(params: [String: Any]) -> Promise<ModelType>
    func delete(params: [String: String]) -> Promise<ModelType>
}
