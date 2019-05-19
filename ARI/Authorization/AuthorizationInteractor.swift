//
//  AuthorizationInteractor.swift
//  ARI
//
//  Created by Maxim Spiridonov on 19/05/2019.
//  Copyright (c) 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

protocol AuthorizationBusinessLogic {
  func makeRequest(request: Authorization.Model.Request.RequestType)
}

class AuthorizationInteractor: AuthorizationBusinessLogic {

  var presenter: AuthorizationPresentationLogic?
  var service: AuthorizationService?
  
  func makeRequest(request: Authorization.Model.Request.RequestType) {
    if service == nil {
      service = AuthorizationService()
    }
    
    switch request {
  
    case .getUser(let socialName):
        
        service?.getUser(socialName: socialName, completion: { [weak self] (user) in
            print(user)
            self?.presenter?.presentData(response: Authorization.Model.Response.ResponseType.presentUserInfo(user: user))
        })

    }
  }
  
}
