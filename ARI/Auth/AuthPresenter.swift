//
//  AuthPresenter.swift
//  ARI
//
//  Created by Maxim Spiridonov on 19/05/2019.
//  Copyright (c) 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

protocol AuthPresentationLogic {
  func presentData(response: Auth.Model.Response.ResponseType)
}

class AuthPresenter: AuthPresentationLogic {
  weak var viewController: AuthDisplayLogic?
  
  func presentData(response: Auth.Model.Response.ResponseType) {
  
  }
  
}
