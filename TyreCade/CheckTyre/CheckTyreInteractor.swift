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
    
    func evaluteAndProcessTyreCode(input: String) {
        
    }
     
    
    func checkUserInput(input: String?) -> Bool {
        debugPrint("checkUserInput called : \(input)")
        return false
    }
}
