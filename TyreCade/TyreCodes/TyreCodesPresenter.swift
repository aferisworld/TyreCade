//
//  TyreCodesPresenter.swift
//  TyreCade
//
//  Created by Nana Aferi on 06/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation

class TyreCodesPresenter: TyreCodesPresenterProtocol {
    
    var tyreCodes: [TyreCodeModel]?
     
    weak var view: TyreCodesViewProtocol?
    
    var interactor: TyreCodesInteractorProtocol?
    
    var wireFrame: TyreCodesWireFrameProtocol?
    
     
    func viewDidLoad() {
          self.interactor?.getTyreCodes(fetchType: .local)  
    }
       
    func getTyreCodes(fetchType: FetchType) {
        interactor?.getTyreCodes(fetchType: fetchType)
    }
    
   
    func getNumberOfSections() -> Int {
        return 1
    }
    
    func getNumberOfTyreCodes() -> Int {
        debugPrint("getNumberOfTyreCodes count ", tyreCodes?.count)
        return tyreCodes?.count ?? 0
    }
     
    
    
}
 
