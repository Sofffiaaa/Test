//
//  AppDelegate.swift
//  Test
//
//  Created by Head HandH on 28.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let assembly = Assembly()
    lazy var dataStorage = assembly.dataStorage
    
  /*  enum StorageKey {
        
        case profile
        
    }*/
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let decoder = JSONDecoder()
            
        let encoder = JSONEncoder()
        
        let userDefaults = UserDefaults.standard
        let key = "key"
        
        guard userDefaults.object(forKey: key) != nil else {
            let profile = Profile(id: "12345", name: "text")
            
            if (try? encoder.encode(profile)) != nil {
                dataStorage.save(value: profile, key: key)
                print(String(reflecting: userDefaults.object(forKey: key)))
        }
            if let profileDecode = try? decoder.decode(Profile.self, from: userDefaults.data(forKey: key)!){
                print(String(reflecting: profileDecode))
            }
            return true
        }
        /*let profileDecode = userDefaults.object(forKey: key)
        if ((try? decoder.decode(Profile.self, from: profileDecode as! Data)) != nil){
            print(profileDecode!)
        }
      //  print(userDefaults.object(forKey: key)!)*/
        
        
    
        
       // guard let data = try? encoder.encode(Profile(id: "1234", name: "text")) else {
       //     let profile = try? decoder.decode(Profile.self, from: data)
        //let profile = try? decoder.decode(Profile.self, from: data)
        //  }
       // userDefaults.set(profile, forKey: "key")
        
        
       /* let dateOfFirstSession = UserDefaults.standard.string(forKey: "dateNow")
        dateSecond = DateFormatterImp(format: dateFirst).formatBack(date: dateOfFirstSession!)!
        
        let timeInterval = dateFirst.timeIntervalSince(dateSecond)
        print("Между запусками приложения прошло: ", timeInterval)*/
        
        return true
    }
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

