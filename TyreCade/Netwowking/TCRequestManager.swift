//
//  TCRequestManager.swift
//  TyreCade
//
//  Created by Nana Aferi on 06/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation
import Alamofire

public class TCRequestManager: Alamofire.SessionManager {


public static let CURRENT_ENV: String = "TEST"
    

public static let ALL_URLS: [String: String] = [
        "TEST" : "https://fakemyapi.com/api/fake?id=edb4ff91-2842-42a6-bb4c-ec74965e0997",
        "STAGING": "https://fakemyapi.com/api/fake?id=edb4ff91-2842-42a6-bb4c-ec74965e0997",
        "PRODUCTION": "https://fakemyapi.com/api/fake?id=edb4ff91-2842-42a6-bb4c-ec74965e0997"
    ]
    
 public static var BASE_URL : String  {
        get {
            return ALL_URLS[CURRENT_ENV]!;
        }
    }
    
  private static let REQUEST_TIMEOUT  : Int = 40
  private static let RESOURCE_TIMEOUT : Int = 40
    
      
   public static let sharedManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        var defaultHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        configuration.httpAdditionalHeaders = defaultHeaders
        //Add additional headers
        //let deviceHeaders = ["x-device-width": UIScreen.main.bounds.width ]
        //configuration.httpAdditionalHeaders = deviceHeaders
        
        configuration.timeoutIntervalForRequest = TimeInterval(TCRequestManager.REQUEST_TIMEOUT)
        configuration.timeoutIntervalForResource = TimeInterval(TCRequestManager.RESOURCE_TIMEOUT)
        
        let manager = Alamofire.SessionManager(configuration: configuration)
        return manager
    }()
}
