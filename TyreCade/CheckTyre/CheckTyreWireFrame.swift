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
     
    static func createCheckTyreModule(mainTabBarVC: UITabBarController) -> UITabBarController {
        
        if let view = mainTabBarVC.viewControllers?.first?.children.first as? CheckTyreView {
            let presenter: CheckTyrePresenterProtocol & CheckTyreInteractorOutputProtocol = CheckTyrePresenter()
            let interactor: CheckTyreInteractorInputProtocol = CheckTyreInteractor()
            let wireFrame: CheckTyreWireFrameProtocol = CheckTyreWireFrame()

            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.wireFrame = wireFrame
            interactor.presenter = presenter
             
            return mainTabBarVC
        }
        return UITabBarController()
    }
    
    
    func presentResultsVC(from view: CheckTyreViewProtocol, code: String) {
        
    }
    
    
}
