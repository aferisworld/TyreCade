//
//  CheckTyreProtocols.swift
//  TyreCade
//
//  Created by Nana Aferi on 01/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import UIKit
import Foundation

protocol CheckTyreViewProtocol: class { 
    var presenter: CheckTyrePresenterProtocol? { get set }
     
    //PRESENTER -> VIEW
    func displayTyreCodeAlertView(title: String, message: String)
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

 
protocol CheckTyrePresenterProtocol: class {
    //view
    var view: CheckTyreViewProtocol? { get set }
    
    //interactor
    var interactor:CheckTyreInteractorInputProtocol? { get set }
    
    //wireframe
    var wireFrame: CheckTyreWireFrameProtocol? { get set }
    
    //VIEW --> PRESENTER
    func viewDidLoad()
    
}


protocol CheckTyreInteractorInputProtocol: class {
    
    var presenter: CheckTyreInteractorOutputProtocol? { get set }
    
    //PRESENTER --> INTERACTOR
    func checkUserInput(input: String?) -> Bool
    
}

protocol CheckTyreInteractorOutputProtocol: class {

    //PRESENTER  ---> INTERACTOR
    func evaluteAndProcessTyreCode(input: String?)
    
    //INTERACTOR ---> PRESENTER
    // func evaluteAndProcessTyreCode(input: String?) -> (hasError:Bool, message: String, tyreCode:TyreCode?)

}

protocol CheckTyreWireFrameProtocol: class {
    
    static func createCheckTyreModule(mainTabBarVC: UITabBarController) -> UITabBarController
    
    // PRESENTER -> WIREFRAME
    func presentResultsVC(from view:CheckTyreViewProtocol, forTyreCode tyrecode: TyreCode)
}
