//
//  AuthViewController.swift
//  ARI
//
//  Created by Maxim Spiridonov on 19/05/2019.
//  Copyright (c) 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import GoogleSignIn

protocol AuthDisplayLogic: class {
    func displayData(viewModel: Auth.Model.ViewModel.ViewModelData)
}

class AuthViewController: UIViewController, AuthDisplayLogic {
    
    var interactor: AuthBusinessLogic?
    var router: (NSObjectProtocol & AuthRoutingLogic)?
    
    
    private var authService: AuthService!
    
    
    
    @IBOutlet weak var signInVKButton: UIButton! {
        didSet {
            signInVKButton.addTarget(self, action: #selector(vkButtonTapped), for: .touchUpInside)
        }
    }
    

    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = AuthInteractor()
        let presenter             = AuthPresenter()
        let router                = AuthRouter()
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
        
        authService = AppDelegate.shared().vkAuthService
        setup()
    }
    
    func displayData(viewModel: Auth.Model.ViewModel.ViewModelData) {
        
    }
    
    @objc private func vkButtonTapped() {
        interactor?.makeRequest(request: Auth.Model.Request.RequestType.authWithVK)
    }
    
}
