//
//  CheckTyreInteractor.swift
//  TyreCade
//
//  Created by Nana Aferi on 02/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation
import RealmSwift

class CheckTyreInteractor: CheckTyreInteractorProtocol {
    var presenter: CheckTyrePresenterProtocol?
    
     
    var tyreCadeFilterOptions: TyreCadeFilterOptions?
    var tyreCadeService = TCService.shared
    
    func evaluteAndProcessTyreCode(input: String?) { 
        
    } 
    
    func checkUserInput(input: String?) -> Bool {
        var result = false
        if let code = input {
               var check1 = false
               var check2 = false
               
               let regex1 = try! NSRegularExpression(pattern: "^[A-Z0-9]+\\d{4}$")
               check1 = regex1.matches(code.uppercased())
        
              let regex2 = try! NSRegularExpression(pattern: "^\\d{4}$")
              check2 = regex2.matches(code.uppercased())
        
               result = check1 || check2
        }
        return result
    }
 
    func processTyreCode(input: String?) -> (code: String?, manufactureDate: Double?, expireDate: Double?) {
        //TODO: Implement processTyreCode method
        let tuple = ("fakecode1212",Double(1000), Double(2000))
        return tuple
    }
    
    func saveTyreCodeInDatabase(input: String, completion: @escaping ((_ isSaved: Bool) -> Void)) {
        //TODO: remove test tuple
        let tuple = (input,Double(0), Double(0))
        tyreCadeService.save(content: tuple).done { _ in
            completion(true)
        }.catch { (error) in
            debugPrint("Error ", error.localizedDescription)
             completion(false)
        }
    }
}


extension NSRegularExpression {
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}
