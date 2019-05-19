//
//  AuthorizationPresenter.swift
//  ARI
//
//  Created by Maxim Spiridonov on 19/05/2019.
//  Copyright (c) 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

protocol AuthorizationPresentationLogic {
  func presentData(response: Authorization.Model.Response.ResponseType)
}

class AuthorizationPresenter: AuthorizationPresentationLogic {
  weak var viewController: AuthorizationDisplayLogic?
  
  func presentData(response: Authorization.Model.Response.ResponseType) {
  
  }
  
}
