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
    
    
    func viewDidLoad() {
        print("CheckTyrePresenter viewDidLoad called")
    }
}

extension CheckTyrePresenter: CheckTyreInteractorOutputProtocol {
    
     
    func evaluteAndProcessTyreCode(input: String?) {
        
        if let isInputValid = interactor?.checkUserInput(input: input) {
            //process code
            debugPrint("process code")
        }else {
            //display invalid code dialog
            let _message = "Invalid Car Tyre Code.\nPlease Enter a valid Car Tyre Code!!"
           // view?.displayTyreCodeAlertView(title: <#String#>, message: _message)
        }
        
    }
    
     
    
    func checkUserInput(input: String?) -> Bool {
       
         return false
    }
    
    
}
 
