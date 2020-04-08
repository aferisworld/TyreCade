//
//  CheckTyreView.swift
//  TyreCade
//
//  Created by Nana Aferi on 02/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import UIKit

class CheckTyreView: UIViewController {
    
    var presenter: CheckTyrePresenterProtocol?
    
    let inputText: UITextField = UITextField()
    let submitButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        

       let logo = UIImage(named: "logowt1.png")
              let imageView = UIImageView(image:logo)
              navigationItem.titleView = imageView
        
        setBackgroundImageView()
        
        setUpInputText()
        
        setUpSubmitButton()
         
    }
    
    func setUpSubmitButton() {
           
           submitButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
           submitButton.backgroundColor = UIColor.orange
           submitButton.setTitle("SUBMIT", for: .normal)
           submitButton.center.x = self.view.center.x
           submitButton.center.y = self.view.center.y + 60
           submitButton.addTarget(self, action:#selector(self.submitButtonClicked), for: .touchUpInside)
         
           view.addSubview(submitButton)
    }
    
    @objc func submitButtonClicked() {
        
        guard let _input = inputText.text else {
            return
        }
        if _input.isEmpty {
            let title = TCConstants.TyreStrings.EmptyInputTitle.rawValue
            let emptyInputMessage = TCConstants.TyreStrings.EmptyInputMessage.rawValue
            self.presenter?.view?.displayTyreCodeAlertView(title: title, message: emptyInputMessage, view: self)
            return
        }
        
        if let result = self.presenter?.interactor?.checkUserInput(input: _input){
            if result {
                //TODO:- process code
                
                //Save code in Realm[DONE]
                self.presenter?.saveTyreCode(input: _input) { isSaved in
                    if isSaved {
                        self.presenter?.view?.displayTyreCodeAlertView(title: "Alert", message: "Tyre code successfully saved!", view: self)
                    } else {
                        self.presenter?.view?.displayTyreCodeAlertView(title: "Error", message: "Could not save tyre code in local database.\n Please try again", view: self)
                   }
                }
            }else {
                let title = TCConstants.TyreStrings.WrongCodeTitle.rawValue
                let wrongCodetMessage = TCConstants.TyreStrings.WrongCodeMessage.rawValue
                self.presenter?.view?.displayTyreCodeAlertView(title: title, message: wrongCodetMessage, view: self)
            }
        }
    }
    
    func setUpInputText() {
        
        inputText.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        inputText.backgroundColor = UIColor.white
        inputText.textAlignment =  NSTextAlignment.center
        let placeholder = NSAttributedString(string: TCConstants.TyreStrings.InputTextPlaceholder.rawValue, attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        inputText.attributedPlaceholder = placeholder
        inputText.center.x = self.view.center.x // for horizontal
        inputText.center.y = self.view.center.y // for vertical
      
        view.addSubview(inputText)
    }
    
    func setBackgroundImageView() {
        
        let backgroundImageView = UIImageView(frame: .zero)
          backgroundImageView.image = UIImage(named: "bg_sm")
        
          view.addSubview(backgroundImageView)
        
          backgroundImageView.translatesAutoresizingMaskIntoConstraints = false

          backgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
          backgroundImageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
          backgroundImageView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
          backgroundImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
   }


}

extension CheckTyreView: CheckTyreViewProtocol {
      
    func showError() {
        
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
     
}
 

