//
//  TCContants.swift
//  TyreCade
//
//  Created by Nana Aferi on 02/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation

enum TCConstants {
    
    
    enum TyreStrings: String {
        case WrongCodeTitle = "Wrong Tyre Code"
        case WrongCodeMessage = "Invalid vehicle tyre code.\nPlease Enter a valid vehicle tyre code!"
        case Ok = "Ok"
        case EmptyInputTitle = "Empty Input"
        case EmptyInputMessage = "Please enter tyre code!"
        case InputTextPlaceholder = "Enter Tyre Code"
        case Submit = "SUBMIT"
        
        //Realm
        case RealmSchemaVersion = "realmSchemaVersion"
        
        //UI Unit testing
        case Testing = "TESTING"
        case RealmInMemoryIdentifier = "TEST-DB"
    }
    
    enum Titles: String {
        case ListCodesTitle = "List of Tyre Codes"
    }
    
    enum StoryboardIdentifiers: String {
        case MainTabBarController = "MainTabBarController"
    }
    
    enum CellIdentifiers: String {
        case TyrecodeCell = "tyrecodeCell"
    }
    
     enum TCViewControllerName: String {
          case CheckTyreView = "CheckTyreView"
          case TyreCodesView = "TyreCodesView"
      }
    
}


 


