//
//  MainTabBarController.swift
//  TyreCade
//
//  Created by Nana Aferi on 02/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
           super.viewDidLoad()
           setUpTabBar()
       }
       
       func setUpTabBar() {
           let newsVC = UINavigationController(rootViewController: CheckTyreView())
           newsVC.tabBarItem = UITabBarItem(title: "Home", image: nil, tag: 0) //(tabBarSystemItem: .bookmarks, tag: 0)
          //  newsVC.tabBarItem.image =
          //  newsVC.tabBarItem.selectedImage =
           
           let reportsVC = UINavigationController(rootViewController: TyreCodesView())
           reportsVC.tabBarItem = UITabBarItem(title: "Tyre Codes", image: nil, tag: 1)
           
           viewControllers = [newsVC, reportsVC]
           
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
