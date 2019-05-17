//
//  AppDelegate.swift
//  ARI
//
//  Created by Maxim Spiridonov on 17/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        let mainVC: MainViewController = MainViewController.loadFromStoryboard()
        let navigationVC = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        
        return true
    }
}

