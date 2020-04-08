//
//  CheckTyrePresenter.swift
//  TyreCade
//
//  Created by Nana Aferi on 02/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation

class CheckTyrePresenter: CheckTyrePresenterProtocol {
     
    var interactor: CheckTyreInteractorProtocol?
    
    weak var view: CheckTyreViewProtocol?
    
    var wireFrame: CheckTyreWireFrameProtocol?
     
    func viewDidLoad() {}
    
    func saveTyreCode(input: String, completion: @escaping(_ isSaved:Bool) -> Void) { 
        
        interactor?.saveTyreCodeInDatabase(input: input) { isSaved in
            completion(isSaved)
        }
    }
     
    
    func evaluteAndProcessTyreCode(input: String?) {
         debugPrint("evaluteAndProcessTyreCode callled")
    }

    func checkUserInput(input: String?) -> Bool {
        debugPrint("checkUserInput called")
         return false
    }
    
} 
