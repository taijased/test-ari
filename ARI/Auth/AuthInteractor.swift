//
//  AuthInteractor.swift
//  ARI
//
//  Created by Maxim Spiridonov on 19/05/2019.
//  Copyright (c) 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

protocol AuthBusinessLogic {
  func makeRequest(request: Auth.Model.Request.RequestType)
}

class AuthInteractor: AuthBusinessLogic {

  var presenter: AuthPresentationLogic?
  var service: AuthService?
  
  func makeRequest(request: Auth.Model.Request.RequestType) {
    if service == nil {
      service = AuthService()
    }
    
    switch request {
    case .authWithVK:
//        service?.getUser(completion: { [weak self] (user) in
//            self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentUserInfo(user: user))
//        })
        break
    }
  }
  
}
