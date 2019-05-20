//
//  AuthorizationViewController.swift
//  ARI
//
//  Created by Maxim Spiridonov on 19/05/2019.
//  Copyright (c) 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

protocol AuthorizationDisplayLogic: class {
    func displayData(viewModel: Authorization.Model.ViewModel.ViewModelData)
}

class AuthorizationViewController: UIViewController, AuthorizationDisplayLogic {
    
    var interactor: AuthorizationBusinessLogic?
    var router: (NSObjectProtocol & AuthorizationRoutingLogic)?
    private var authService: AuthService!
    
    @IBOutlet weak var buttonSignInVK: UIButton! {
        didSet {
            buttonSignInVK.addTarget(self, action: #selector(getVKUserInfo), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var buttonSignInGoogle: UIButton! {
        didSet {
            buttonSignInGoogle.addTarget(self, action: #selector(getGoogleUserInfo), for: .touchUpInside)
        }
    }
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = AuthorizationInteractor()
        let presenter             = AuthorizationPresenter()
        let router                = AuthorizationRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: Routing
    
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        authService = AppDelegate.shared().authService
    }
    
    
    
    
    func displayData(viewModel: Authorization.Model.ViewModel.ViewModelData) {
        
    }
    
    
    
    
    
    @objc func getVKUserInfo() {
        authService.wakeUpSession()
        interactor?.makeRequest(request: Authorization.Model.Request.RequestType.getUser(socialName: "vk"))
    }
    
    
    @objc func getGoogleUserInfo() {
//        authService.wakeUpSession()
        interactor?.makeRequest(request: Authorization.Model.Request.RequestType.getUser(socialName: "google"))
    }
    
}
