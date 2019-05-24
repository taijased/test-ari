//
//  ARViewController.swift
//  ARI
//
//  Created by Maxim Spiridonov on 24/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

class ARViewController: UIViewController {
    
    private var bottomControls = ARBottomControls()
    
    override func viewDidLoad() {
        super.viewDidLoad()

         setupBottomControls()
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
}

// MARK: ARBottomControlsDelegate
extension ARViewController: ARBottomControlsDelegate {
    func bottomControlActions(buttonName: String) {
        print(buttonName)
    } 
}
