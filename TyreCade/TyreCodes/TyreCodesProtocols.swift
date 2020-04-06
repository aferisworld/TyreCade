//
//  TyreCodesProtocols.swift
//  TyreCade
//
//  Created by Nana Aferi on 06/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation
import UIKit

protocol TyreCodesPresenterProtocol: class {
    //View
    var view: TyreCodesViewProtocol? { get set }
    
    //Interactor
    var interactor: TyreCodesInteractorProtocol? { get set }
    
    //WireFrame
    var wireFrame: TyreCodesWireFrameProtocol? { get set }
    
    var tyreCodes: [TyreCodeModel]? { get set }
    
    func getTyreCodes(fetchType: FetchType) -> ()
    
    func viewDidLoad() -> ()
    
    //For TableView methods
    func getNumberOfSections() -> Int
    func getNumberOfTyreCodes() -> Int
    
    
}

protocol TyreCodesViewProtocol: class {
    
    var presenter: TyreCodesPresenterProtocol? { get set }
    
    //PRESENTER -> VIEW
   func showTyreCodes(with tyreCodes: [TyreCodeModel])
   
   func showError()
   
   func showLoading()
   
   func hideLoading()
    
}

protocol TyreCodesInteractorProtocol: class {
    var presenter: TyreCodesPresenterProtocol? { get set }
    
    func getTyreCodes(fetchType: FetchType) -> ()
    
    // INTERACTOR -> PRESENTER
       func didFetchTyreCodes(_ tyreCodes: [TyreCodeModel])
}

protocol TyreCodesWireFrameProtocol: class { 
      static func createTyreCodesModule(mainTabBarVC: UITabBarController)
}
