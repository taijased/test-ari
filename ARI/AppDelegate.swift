//
//  AppDelegate.swift
//  ARI
//
//  Created by Maxim Spiridonov on 17/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import VK_ios_sdk
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var authService: AuthService!

    static func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
         window = UIWindow()
        
        
        // MARK: Sign In VK
        
        self.authService = AuthService()
        authService.delegate = self
        
        
        
       
//        let mainVC: MainViewController = MainViewController.loadFromStoryboard()
        
        
        let authVC: AuthorizationViewController = AuthorizationViewController.loadFromStoryboard()
        let navigationVC = UINavigationController(rootViewController: authVC)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        
        return true
    }
}



// MARK: VKAuthServiceDelegate


extension AppDelegate: AuthServiceDelegate {
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
        return true
    }
    
    // MARK: AuthServiceDelegate
    func authServiceShouldShow(_ viewController: UIViewController) {
        print(#function)
        window?.rootViewController?.present(viewController, animated: true, completion: nil)
    }
    
    func authServiceSignIn() {
        print(#function)
        let mainVC: MainViewController = MainViewController.loadFromStoryboard()
        let navigationVC = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = navigationVC
    }
    
    func authServiceDidSignInFail() {
        print(#function)
    }
}


// MARK: GIDSignInDelegate

extension AppDelegate: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        <#code#>
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize sign-in
        GIDSignIn.sharedInstance().clientID = "136451453907-h8tt30oad17p16omlmgk5r33s7sjndid.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }
    
    
    
}
