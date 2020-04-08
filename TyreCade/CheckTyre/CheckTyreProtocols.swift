//
//  CheckTyreProtocols.swift
//  TyreCade
//
//  Created by Nana Aferi on 01/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import UIKit
import Foundation

protocol CheckTyreViewProtocol: BaseViewProtocol { 
     
}

 
protocol CheckTyrePresenterProtocol: BasePresenterProtocol {
    //view
    var view: CheckTyreViewProtocol? { get set }
    
    //interactor
    var interactor: CheckTyreInteractorProtocol? { get set }
    
    //wireframe
    var wireFrame: CheckTyreWireFrameProtocol? { get set }
    
    //VIEW --> PRESENTER
    func viewDidLoad()
    
    func saveTyreCode(input: String, completion: @escaping(_ status:Bool) -> Void)
}


protocol CheckTyreInteractorProtocol: class {
    
    var presenter: CheckTyrePresenterProtocol? { get set }
    
    //PRESENTER --> INTERACTOR
    func checkUserInput(input: String?) -> Bool
    
    func saveTyreCodeInDatabase(input: String, completion: @escaping ((_ isSaved: Bool) -> Void))
    
    func processTyreCode(input: String?) -> (code:String?, manufactureDate:Double?, expireDate:Double?)
    
    func evaluteAndProcessTyreCode(input: String?)
    
}


protocol CheckTyreWireFrameProtocol: BaseWireFrameProtocol {
}
 

//MARK:- Base Protocols

protocol BaseWireFrameProtocol: class {
    
    //static func createCheckTyreModule(mainTabBarVC: UITabBarController)
    static func createModule(mainTabBarVC: UITabBarController)
    
    // PRESENTER -> WIREFRAME
    func presentVC(from view:BaseViewProtocol, code: String)
}


protocol BaseViewProtocol: class {
     
    //PRESENTER -> VIEW
    func displayTyreCodeAlertView(title: String, message: String, view:UIViewController)
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

extension BaseViewProtocol {
    func displayTyreCodeAlertView(title: String, message: String, view: UIViewController) {
    if !message.isEmpty {
               let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
               let action = UIAlertAction(title: TCConstants.TyreStrings.Ok.rawValue, style: .default) { (action) in

               }
               alert.addAction(action)
               view.present(alert, animated: true)
           }
    }
}

protocol BasePresenterProtocol: class {
    
    //VIEW --> PRESENTER
    func viewDidLoad()
}
