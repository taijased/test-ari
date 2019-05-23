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
    
    @IBOutlet weak var categoryNameView: UIView! {
        didSet {
            categoryNameView.backgroundColor = .clear
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
        
        setupTopSaleCollection()
        setupCategoryNameCollection()
        setupSectionCollection()
        setupBottomControls()
    }
    
    private func setupCategoryNameCollection() {

//        categoryNameView.frame.size.height = UILabel.getLabelSize(text: "temp", fontSize: 26, fontName: "TTNorms-Bold").height
        categoryNameView.addSubview(categoryNameCollectionView)
        categoryNameCollectionView.fillSuperview()
        categoryNameCollectionView.categoryDelegate = self
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
        //        sectionCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: topSaleView.frame.height).isActive = true
        //        sectionCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //        sectionCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //        sectionCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor,  constant: 20).isActive = true
        
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
        self.scrollView.setContentOffset(desiredOffset, animated: true)
    }
    
    func scrollBegin(_ scrollView: UIScrollView) {
        

        if scrollView.contentOffset.y < view.frame.height {
            let desiredOffset = CGPoint(x: 0, y: topSaleCollectionView.frame.height + 20)
//            print(topSaleCollectionView.frame.height)
//            print(scrollView.contentOffset)
//            print(desiredOffset)
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
