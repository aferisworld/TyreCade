//
//  TyreCodesWireFrame.swift
//  TyreCade
//
//  Created by Nana Aferi on 06/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation
import UIKit

class TyreCodesWireFrame: TyreCodesWireFrameProtocol {
    
    static func createModule(mainTabBarVC: UITabBarController) {
        if let view = mainTabBarVC.viewControllers?.last?.children.last as? TyreCodesView {
                          let presenter: TyreCodesPresenterProtocol = TyreCodesPresenter()
                          let interactor: TyreCodesInteractorProtocol = TyreCodesInteractor()
                          let wireFrame: TyreCodesWireFrameProtocol = TyreCodesWireFrame()

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
