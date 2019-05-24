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
    private var topSaleCollectionView = ReadySolutionCollectionView()
    private var sectionCollectionView = SectionCollectionView()
    private var categoryNameCollectionView = CategoryNameCollectionView()
    
    @IBOutlet weak var topSaleView: UIView! {
        didSet {
            topSaleView.backgroundColor = .clear
        }
    }
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var categoryView: UIView! {
        didSet {
            categoryView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    

    
    let sectionHeader: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
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
        
        setupTopSaleCollection()
        setupSectionCollection()
        setupCategoryNameCollection()
        setupBottomControls()
        
    }
    
    private func setupCategoryNameCollection() {
        
        categoryView.addSubview(sectionHeader)
        sectionHeader.topAnchor.constraint(equalTo: categoryView.topAnchor).isActive = true
        sectionHeader.trailingAnchor.constraint(equalTo: categoryView.trailingAnchor).isActive = true
        sectionHeader.leadingAnchor.constraint(equalTo: categoryView.leadingAnchor).isActive = true
        sectionHeader.heightAnchor.constraint(equalToConstant: 50).isActive = true
        sectionHeader.addSubview(categoryNameCollectionView)
        categoryNameCollectionView.fillSuperview()
        categoryNameCollectionView.categoryDelegate = self

        let gradient = CAGradientLayer()
        gradient.colors = [UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor,
                           UIColor(red: 1, green: 1, blue: 1, alpha: 0).cgColor]  // your colors go here
        gradient.locations = [0.6, 1]
        gradient.frame = CGRect(x: 0, y: 0, width: view.frame.width + 10, height: 70)
        sectionHeader.layer.insertSublayer(gradient, at: 0)
    }
    
    private func setupTopSaleCollection() {
        topSaleView.addSubview(topSaleCollectionView)
        topSaleCollectionView.topAnchor.constraint(equalTo: topSaleView.topAnchor, constant: 60).isActive = true
        topSaleCollectionView.trailingAnchor.constraint(equalTo: topSaleView.trailingAnchor).isActive = true
        topSaleCollectionView.leadingAnchor.constraint(equalTo: topSaleView.leadingAnchor).isActive = true
        topSaleCollectionView.bottomAnchor.constraint(equalTo: topSaleView.bottomAnchor,  constant: 20).isActive = true
    }
    
    private func setupSectionCollection() {
        categoryView.frame.size.width = view.frame.size.width
        categoryView.frame.size.height = view.frame.size.height
        
        categoryView.addSubview(sectionCollectionView)
        sectionCollectionView.fillSuperview()
        sectionCollectionView.sectionDelegate = self
        
    }
    private func setupBottomControls() {
        view.addSubview(bottomControls)
        bottomControls.translatesAutoresizingMaskIntoConstraints = false
        bottomControls.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomControls.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomControls.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomControls.heightAnchor.constraint(equalToConstant: Constants.bottomControlsHeight).isActive = true
        
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
        case "account": print(buttonName)
        default: break
        }
    }
    
}


//// MARK: SectionCollectionViewDelegate


extension MainViewController: SectionCollectionViewDelegate {
    func scrollTop(_ scrollView: UIScrollView) {
        let desiredOffset = CGPoint(x: 0, y: 0)
        
        self.topSaleView.isHidden = false

        self.scrollView.setContentOffset(desiredOffset, animated: true)
    }
    
    func scrollBegin(_ scrollView: UIScrollView) {
        

        if scrollView.contentOffset.y < view.frame.height {
            let desiredOffset = CGPoint(x: 0, y: topSaleCollectionView.frame.height + 20)
            self.topSaleView.isHidden = true
            
            self.scrollView.setContentOffset(desiredOffset, animated: true)
            
            
        }
    }
    
    func currentPage(indexPage: Int) {
        categoryNameCollectionView.setColor(index: indexPage)
//        interactor?.makeRequest(request: Main.Model.Request.RequestType.getCurrentPage(page: indexPage))
    }
}


// MARK: CategoryNameCollectionViewDelegate

extension MainViewController: CategoryNameCollectionViewDelegate {
    func currentSection(indexPage: Int) {
        sectionCollectionView.scrollSection(index: indexPage)
    }
}
