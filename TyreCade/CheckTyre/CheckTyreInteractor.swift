//
//  CheckTyreInteractor.swift
//  TyreCade
//
//  Created by Nana Aferi on 02/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation

class CheckTyreInteractor: CheckTyreInteractorInputProtocol {
    
    var presenter: CheckTyreInteractorOutputProtocol?
    
    var tyreCadeFilterOptions: TyreCadeFilterOptions?
    var tyreCadeService = TCService.shared
    
    func evaluteAndProcessTyreCode(input: String?) {
         debugPrint("evaluteAndProcessTyreCode --->>><<<< called : \(input)")
        
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
    
    func saveTyreCodeInDatabase(input: String) -> Bool {
           print("interactor saveTyreCodeInDatabase called")
        return false
    }
}


extension NSRegularExpression {
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}
