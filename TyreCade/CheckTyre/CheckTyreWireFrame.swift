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
        //debugPrint("createCheckTyreModule --> ", mainTabBarVC.viewControllers?.first?.children.first)
        if let view = mainTabBarVC.viewControllers?.first?.children.first as? CheckTyreView {
             debugPrint("createCheckTyreModule --> ", view)
            let presenter: CheckTyrePresenterProtocol & CheckTyreInteractorOutputProtocol = CheckTyrePresenter()
            let interactor: CheckTyreInteractorInputProtocol = CheckTyreInteractor()
            let wireFrame: CheckTyreWireFrameProtocol = CheckTyreWireFrame()

            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.wireFrame = wireFrame
            interactor.presenter = presenter
            
           // let secondVC = mainTabBarVC.viewControllers?.last
            // mainTabBarVC.viewControllers = [view, secondVC!]
            
            return mainTabBarVC
        }
        return UITabBarController()
    }
    
    
    func presentResultsVC(from view: CheckTyreViewProtocol, forTyreCode tyrecode: TyreCode) {
        
    }
    
    
}
