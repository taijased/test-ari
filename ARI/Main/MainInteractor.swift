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
        switch request {
        case .getCurrentPage(let page):
            presenter?.presentData(response: Main.Model.Response.ResponseType.setColorCategoryName(index: page))
            
        case .tappedBottomControls(let buttonName):
            guard let segueName = service?.getSegueName(buttonName: buttonName) else { return }
            presenter?.presentData(response: Main.Model.Response.ResponseType.setSelfToSegue(segueName: segueName))
        }
    }
    
    
}
