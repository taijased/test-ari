//
//  MainViewController.swift
//  ARI
//
//  Created by Maxim Spiridonov on 17/05/2019.
//  Copyright (c) 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

protocol MainDisplayLogic: class {
    func displayData(viewModel: Main.Model.ViewModel.ViewModelData)
}

class MainViewController: UIViewController, MainDisplayLogic {
    
    var interactor: MainBusinessLogic?
    var router: (NSObjectProtocol & MainRoutingLogic)?
    
    private var bottomControls = MainBottomControls()
    private var topSaleCollectionView = TopSaleCollectionView()
    
    @IBOutlet weak var topSaleView: UIView! {
        didSet {
            topSaleView.backgroundColor = .clear
            
        }
    }
    
    // MARK: Setup
    private func setup() {
        let viewController        = self
        let interactor            = MainInteractor()
        let presenter             = MainPresenter()
        let router                = MainRouter()
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
        setupBottomControls()
        setupTopSaleCollection()
    }
    
    private func setupTopSaleCollection() {
        topSaleView.addSubview(topSaleCollectionView)
        topSaleCollectionView.topAnchor.constraint(equalTo: topSaleView.topAnchor, constant: 60).isActive = true
        topSaleCollectionView.trailingAnchor.constraint(equalTo: topSaleView.trailingAnchor).isActive = true
        topSaleCollectionView.leadingAnchor.constraint(equalTo: topSaleView.leadingAnchor).isActive = true
        topSaleCollectionView.bottomAnchor.constraint(equalTo: topSaleView.bottomAnchor,  constant: 20).isActive = true

    }
    private func setupBottomControls() {
        view.addSubview(bottomControls)
        bottomControls.translatesAutoresizingMaskIntoConstraints = false
        
        bottomControls.anchor(top: nil,
                              leading: nil,
                              bottom: view.bottomAnchor,
                              trailing: view.trailingAnchor,
                              padding: UIEdgeInsets(top: 777, left: 777, bottom: 15, right: 8),
                              size: CGSize(width: 170, height: 50))
        
        bottomControls.delegate = self
    }
    
    
    
    
    
    func displayData(viewModel: Main.Model.ViewModel.ViewModelData) {
        
    }
    
}


// MARK: BottomControlsDelegate

extension MainViewController: BottomControlsDelegate {
    func bottomControlActions(buttonName: String) {
        switch buttonName {
        case "settings": print(buttonName)
        case "search": print(buttonName)
        case "plus": print(buttonName)
        default: break
        }
    }

}
