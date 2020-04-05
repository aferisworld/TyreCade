//
//  MainTabBarController.swift
//  TyreCade
//
//  Created by Nana Aferi on 02/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var checkTyreVC: UINavigationController! = nil
    var tyreCodesVC: UINavigationController! = nil

    override func viewDidLoad() {
           super.viewDidLoad()
          
          tabBar.barTintColor = .black
          tabBarController?.tabBar.isTranslucent = true
        
           setUpTabBar()
    }
       
       func setUpTabBar() {
           checkTyreVC = UINavigationController(rootViewController: CheckTyreView())
           checkTyreVC.tabBarItem = UITabBarItem(title: "Home", image: nil, tag: 0)
        
           tyreCodesVC = UINavigationController(rootViewController: TyreCodesView())
           tyreCodesVC.tabBarItem = UITabBarItem(title: "Tyre Codes", image: nil, tag: 1)
        
        [checkTyreVC, tyreCodesVC].forEach{ $0.navigationBar.barTintColor = .orange }
        [checkTyreVC, tyreCodesVC].forEach{ $0.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white] }
             
           viewControllers = [checkTyreVC, tyreCodesVC]
           
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
