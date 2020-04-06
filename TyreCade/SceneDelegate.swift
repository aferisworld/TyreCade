//
//  SceneDelegate.swift
//  TyreCade
//
//  Created by Nana Aferi on 02/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var dataController: DataController!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
               // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
               // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
                
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        //SetUp Realm Database
        setUpRealm()
        
        let mainVC = MainTabBarController()
        let _ = CheckTyreWireFrame.createCheckTyreModule(mainTabBarVC: mainVC)
        TyreCodesWireFrame.createTyreCodesModule(mainTabBarVC: mainVC)
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
         
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
        
        //Cancels all ongoing requests
        TCAPIClient.shared.cancelAllOngoingRequests()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        //Remove all requests from api client
        TCAPIClient.shared.removeAllRequestsFromAPIClient()
    }

    func setUpRealm() {
          
        //SetUp Reaml
        dataController = DataController()
           
        let isRealmSetUp =  dataController.setUpReamlConfiguration()
           
           if isRealmSetUp {
               let currentRealmSchemaVersion = dataController.realm.configuration.schemaVersion
               if let oldSchemaVerion = DataController.getRealmSchemaVersion() {
                   if currentRealmSchemaVersion > oldSchemaVerion {
                       let _ = DataController.deleteAllRealmObjects()
                   }
               }else{
                   DataController.saveCurrentRealmSchemaVersion(versionNumber: currentRealmSchemaVersion)
                   let _ = DataController.deleteAllRealmObjects()
               }
               
           }
    }
       

}

