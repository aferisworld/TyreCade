//
//  TyreCodesInteractor.swift
//  TyreCade
//
//  Created by Nana Aferi on 06/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation
import PromiseKit

class TyreCodesInteractor: TyreCodesInteractorProtocol {
    
    weak var presenter: TyreCodesPresenterProtocol?
    
    var tcService = TCService.shared
    
    func getTyreCodes(fetchType: FetchType) {
       
        firstly {
            tcService.fetch(filter: TyreCadeFilterOptions(), fetchType: fetchType)
        }.done {  [weak self] tyrecodes in
                self?.presenter?.tyreCodes = tyrecodes
                self?.presenter?.view?.showTyreCodes(with: tyrecodes)
        }.catch { (error) in
            debugPrint("Error:: \(error.localizedDescription)")
            //TODO:- show error view
        } 
    }
    
    func didFetchTyreCodes(_ tyreCodes: [TyreCodeModel]) {
        
    }
    
    
}
