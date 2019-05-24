//
//  MainRouter.swift
//  ARI
//
//  Created by Maxim Spiridonov on 17/05/2019.
//  Copyright (c) 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

protocol MainRoutingLogic {
    func goToSegue(selfToSegue: String)
}

class MainRouter: NSObject, MainRoutingLogic {


    weak var viewController: MainViewController?
    
    // MARK: Routing
    
    func goToSegue(selfToSegue: String) {
        
        viewController?.performSegue(withIdentifier: selfToSegue, sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // prepare here some data for destination viewController
    }
}
