//
//  AuthorizationWorker.swift
//  ARI
//
//  Created by Maxim Spiridonov on 19/05/2019.
//  Copyright (c) 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

class AuthorizationService {
    
    var authService: AuthService
    var networking: Networking
    var fetcher: DataFetcher
    
    
    init() {
        self.authService = AppDelegate.shared().authService
        self.networking = NetworkService(authService: authService)
        self.fetcher = NetworkDataFetcher(networking: networking)
    }
    
    func getUser(socialName: String, completion: @escaping (UserResponse?) -> Void) {
//        print(socialName)
        fetcher.getUser(socialName: socialName) { (userResponse) in
            completion(userResponse)
        }
    }
}
