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
     
    
    func checkUserInput(input: String?) -> Bool {
        
         return false
    }
    
    func evaluteAndProcessTyreCode(input: String) {
        
    }
    
    
}

//extension CheckTyrePresenter: CheckTyreInteractorProtocol {
//
//
//
//     func checkUserInput(input: String?) -> Bool {
//        return false
//    }
//
//
//
//    func evaluteAndProcessTyreCode(input: String) {
//        debugPrint("evaluteAndProcessTyreCode called")
//
//        guard let isValidCode = interactor?.checkUserInput(input: input)
//            else { return }
//        if isValidCode {
//            //process code
//        }else {
//            //display invalid code dialog
//            let _message = "Invalid Car Tyre Code.\nPlease Enter a valid Car Tyre Code!!"
//            view?.displayWrongTyreCodeAlertView(message: _message)
//        }
//    }
//
//}
