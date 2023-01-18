//
//  AppDelegate.swift
//  Go Fitness
//
//  Created by Otabek Tuychiev on 11/01/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: WorkoutVC())
        window?.makeKeyAndVisible()
        
        return true
    }



}

