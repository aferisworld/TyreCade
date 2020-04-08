//
//  CheckTyreWireFrame.swift
//  TyreCade
//
//  Created by Nana Aferi on 02/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import UIKit
import Foundation

class CheckTyreWireFrame: CheckTyreWireFrameProtocol {
   
    static func createModule(mainTabBarVC: UITabBarController) {
        
        if let view = mainTabBarVC.viewControllers?.first?.children.first as? CheckTyreView {
            let presenter: CheckTyrePresenterProtocol = CheckTyrePresenter()
            let interactor: CheckTyreInteractorProtocol = CheckTyreInteractor()
            let wireFrame: CheckTyreWireFrameProtocol = CheckTyreWireFrame()

            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.wireFrame = wireFrame
            interactor.presenter = presenter
              
        }
    }
    
    func presentVC(from view: BaseViewProtocol, code: String) {
           
       }
     
    
    
}
