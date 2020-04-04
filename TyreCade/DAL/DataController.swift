//
//  DataController.swift
//  TyreCade
//
//  Created by Nana Aferi on 04/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation
import RealmSwift

class DataController {
    
    let databaseName = "ty_db"
    
    var realm:Realm!
     
     static func getReaml() -> Realm? {
        if let sceneDelegate = UIApplication.shared.connectedScenes as? SceneDelegate {
             let reaml = sceneDelegate.dataController.realm
             return reaml
         }
        return nil
     }

     /**
      Sets up realm configuration
      - author :  Nana  Aferi
      - note : Last editored by Nana Aferi
      - returns Bool : returns true if realm has been setup correctly
      */
     func setUpReamlConfiguration() -> Bool {


         var isReamlSetUp = true

         var config = Realm.Configuration(
             // Set the new schema version. This must be greater than the previously used
             // version (if you've never set a schema version before, the version is 0).
             schemaVersion: 1, // version 70 adding layerTeamChatId property to UserEntity
             // Set the block which will be called automatically when opening a Realm  with
             // a schema version lower than the one set above
             migrationBlock: { migration, oldSchemaVersion in
                 // We haven’t migrated anything yet, so oldSchemaVersion == 0
             })


         // Use the default directory, but replace the filename with the oi database name
         config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(databaseName).realm")

         // Tell Realm to use this new configuration object for the default Realm
         Realm.Configuration.defaultConfiguration = config

         let defaultURL = Realm.Configuration.defaultConfiguration.fileURL!
         debugPrint("defaultURL --> \(defaultURL)")
         debugPrint("config schemaVersion ---> \(config.schemaVersion)")
         // Now that we've told Realm how to handle the schema change, opening the file
         // will automatically perform the migration
         do {
             realm = try Realm(configuration: config)
         }catch {
             isReamlSetUp = false
         }

         return isReamlSetUp

     }

   /**
     Deletes all Realm Objects
     - author :  Nana  Aferi
     - note : Last editored by Nana Aferi
     - returns Bool : returns true if realm database was deleted successfully
     */
     static func deleteAllRealmObjects() -> Bool?{

         var isDone = true
         do {
             try DataController.getReaml()?.write {
                 DataController.getReaml()?.refresh()
                 DataController.getReaml()?.deleteAll()
             }
         }catch {
             isDone = false
         }

         return isDone
     }
    
    
    /**
    Get Realm Schema version
    - author :  Nana  Aferi
    - note : Last editored by Nana Aferi
    - returns UInt64 : returns  current realm schema version
    */
    static func getRealmSchemaVersion()-> UInt64?{
           let defaults = UserDefaults.standard
        return defaults.object(forKey: TCConstants.TyreStrings.RealmSchemaVersion.rawValue) as? UInt64  
     }
    
    /**
    Save Current Realm Schema version
    - author :  Nana  Aferi
    - note : Last editored by Nana Aferi
    */
    static func saveCurrentRealmSchemaVersion(versionNumber: UInt64){
        let defaults = UserDefaults.standard
        defaults.set(versionNumber, forKey: TCConstants.TyreStrings.RealmSchemaVersion.rawValue)
        defaults.synchronize()
        
    }

}
