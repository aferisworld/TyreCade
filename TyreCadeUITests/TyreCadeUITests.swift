//
//  TyreCadeUITests.swift
//  TyreCadeUITests
//
//  Created by Nana Aferi on 08/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//
 
import Foundation
import UIKit
import XCTest

class TyreCadeUITests: XCTestCase {
    
     var app:XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append(TCConstants.TyreStrings.Testing.rawValue)
    }

    override func tearDown() {
        app.terminate()
    }
    func testEmptyInputText() {
        app.launchArguments.append(TCConstants.TyreStrings.Testing.rawValue)
        app.launch()
        sleep(1)
        app.buttons[TCConstants.TyreStrings.Submit.rawValue].tap()
        sleep(2)
        app.alerts[TCConstants.TyreStrings.EmptyInputTitle.rawValue].scrollViews.otherElements.buttons[TCConstants.TyreStrings.Ok.rawValue].tap()
    }
    
    func testInvalidInputText() {
        app.launchArguments.append(TCConstants.TyreStrings.Testing.rawValue)
        app.launch()
        
        sleep(1)
        let enterTyreCodeTextField = app.textFields[TCConstants.TyreStrings.InputTextPlaceholder.rawValue]
        enterTyreCodeTextField.tap()
        enterTyreCodeTextField.typeText("ASJDJW") 
        sleep(2)
        app.buttons[TCConstants.TyreStrings.Submit.rawValue].tap()
        app.alerts[TCConstants.TyreStrings.WrongCodeTitle.rawValue].scrollViews.otherElements.buttons[TCConstants.TyreStrings.Ok.rawValue].tap()
    }
    
    func testValidInputText() {
        app.launchArguments.append(TCConstants.TyreStrings.Testing.rawValue)
        app.launch()
        sleep(1)
        let enterTyreCodeTextField = app.textFields[TCConstants.TyreStrings.InputTextPlaceholder.rawValue]
        enterTyreCodeTextField.tap()
         enterTyreCodeTextField.typeText("DOTPOF0923")
        enterTyreCodeTextField.tap()
        sleep(2)
        app.buttons[TCConstants.TyreStrings.Submit.rawValue].tap()
    }
    
    
}
