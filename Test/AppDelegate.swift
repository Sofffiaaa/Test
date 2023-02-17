//
//  AppDelegate.swift
//  Test
//
//  Created by Head HandH on 28.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let encoder = JSONEncoder()
    private let assembly = Assembly()
    
    let profile = "profile"
    
    lazy var dataStorage = assembly.dataStorage
    lazy var apiClient = assembly.apiClient
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("didFinishLaunchingWithOptions")
        
        print("start load profile...\(Thread.isMainThread)")
        
        apiClient.profile(_type: ProfileResponseData.self){ result in
            switch result {
            case .success(let profile):
                guard let profile = try? result.get().data else {
                    return
                }
                self.dataStorage.save(value: profile.profile, key: "key")
                print("Download successful \(profile)")
                self.dataStorage.save(value: profile, key: "key")
            case .failure(let error):
                print("Download error \(error)")
            }
        }
        
        if let profile: Profile = dataStorage.value(key: "key") {
            print(profile)
        }
        
        print("...end load profile \(Thread.isMainThread)")
        
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

