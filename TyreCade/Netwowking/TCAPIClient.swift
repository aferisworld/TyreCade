//
//  TCAPIClient.swift
//  TyreCade
//
//  Created by Nana Aferi on 06/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class TCAPIClient {
    
    // MARK: - Properties
    
    static let shared = TCAPIClient()
    
    var requests = [DataRequest]()
     
    private init(){}
    
 
    
    //Get tryecodes from Online
    func getTyreCodesFromOnline(completion: @escaping (_ responseData: JSON?, _ error: String?) -> Void) {
        let url = TCRequestManager.BASE_URL
            //TCRoutes.apiVersion
        
        var headers:[String : String] = [:]
          headers = ["Content-Type" : "application/json"] 
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON  { (responseData) in
            
            debugPrint("ResponseData  from onile : \(responseData)")
            
            if responseData.response?.statusCode == 200 {
                if let data = responseData.result.value {
                    let jsonData = JSON(data)
                    completion(jsonData, nil)
                }else{
                    completion(nil, "error")
                }
            }else{
                completion(nil, "error")
            }
        }
        
    }
    
    /**
     Cancels on requests in self.requests and then empties the requests array.
     This is especially useful to cancel any ongoing requests started before the user logs out of the app.
     In addition, the method is called when the `applicationWillTerminate` delegate methon `AppDelegate` class is called.
     */
    func cancelAllOngoingRequests(){
        self.requests.forEach({$0.cancel()})
        self.requests.removeAll()
    }
    
    /**
     Removes all requests in the requests array
     */
    func removeAllRequestsFromAPIClient(){
        self.requests.removeAll()
    }
    
    /**
     Remove the request from the self.request(array). In the case where this is not done, we stand the risk of having a larged sized array
     
     - Paramter thisRequest: The request to be removed
     
     - author Nana Aferi
     - note Last editored by Nana Aferi
     */
    
    func removeThisRequest(thisRequest: DataRequest){
        // Remove the request from self.requests when completed
        if let index = self.requests.firstIndex(where: {$0.request?.url == thisRequest.request?.url}) {
            self.requests.remove(at: index)
        }
    }
    
}







