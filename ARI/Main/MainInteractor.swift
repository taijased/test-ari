//
//  MainInteractor.swift
//  ARI
//
//  Created by Maxim Spiridonov on 17/05/2019.
//  Copyright (c) 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

protocol MainBusinessLogic {
  func makeRequest(request: Main.Model.Request.RequestType)
}

class MainInteractor: MainBusinessLogic {

  var presenter: MainPresentationLogic?
  var service: MainService?
  
  func makeRequest(request: Main.Model.Request.RequestType) {
    if service == nil {
      service = MainService()
    }
  }
  
}
