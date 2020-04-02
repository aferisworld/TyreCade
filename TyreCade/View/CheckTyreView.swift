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
     
        setBackgroundImageView()
        
        setUpInputText()
        
        setUpSubmitButton()
        
        print("CheckTyreView presenter  1 : ", presenter)
    }
    
    func setUpSubmitButton() {
           
           submitButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
           submitButton.backgroundColor = UIColor.orange
           submitButton.setTitle("SUBMIT", for: .normal)
           submitButton.center.x = self.view.center.x // for horizontal
           submitButton.center.y = self.view.center.y + 60 // for vertical
           submitButton.addTarget(self, action:#selector(self.submitButtonClicked), for: .touchUpInside)
         
           view.addSubview(submitButton)
    }
    
    @objc func submitButtonClicked() {
        print("Button Clicked : ", self.presenter)
        let _ = self.presenter?.interactor?.checkUserInput(input: inputText.text)
    }
    
    func setUpInputText() {
        
        inputText.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        inputText.backgroundColor = UIColor.white
        inputText.textAlignment =  NSTextAlignment.center
        let placeholder = NSAttributedString(string: "Enter Tyre Code", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
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
    
    func displayWrongTyreCodeAlertView(message: String) {
        //        if !message.isEmpty {
        //            let alert = UIAlertController(title: TCConstants.TyreStrings.WrongCodeTitle.rawValue, message: message, preferredStyle: .alert)
        //            let action = UIAlertAction(title: TCConstants.TyreStrings.Ok.rawValue, style: .default) { (action) in
        //
        //            }
        //            alert.addAction(action)
        //        }
    }
    
    func showError() {
        
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
     
}
 

