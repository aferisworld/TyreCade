//
//  CheckTyrePresenter.swift
//  TyreCade
//
//  Created by Nana Aferi on 02/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation

class CheckTyrePresenter: CheckTyrePresenterProtocol {
     
    var interactor: CheckTyreInteractorInputProtocol?
    
    weak var view: CheckTyreViewProtocol?
    
    var wireFrame: CheckTyreWireFrameProtocol?
     
    func viewDidLoad() {}
    
    func saveTyreCode(input: String) { 
        guard let interactor  = interactor  else { return  }
        
        interactor.saveTyreCodeInDatabase(input: input) { isSaved in
             if isSaved {
                self.view?.displayTyreCodeAlertView(title: "Alert", message: "Tyre code successfully saved!")
             } else {
                self.view?.displayTyreCodeAlertView(title: "Error", message: "Could not save tyre code in local database.\n Please try again")
             }
        }
    }
     
}

extension CheckTyrePresenter: CheckTyreInteractorOutputProtocol {


    func evaluteAndProcessTyreCode(input: String?) {
         debugPrint("evaluteAndProcessTyreCode callled")
    } 

    func checkUserInput(input: String?) -> Bool {
        debugPrint("checkUserInput called")
         return false
    }


}
 
