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

    private  let clearButton: UIButton = {
        let button = UIButton.getCustomtButton(imageName: "clear-scene")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(clearTapped), for: .touchUpInside)
        button.backgroundColor = UIColor(hexValue: "#CB4B4B", alpha: 1)
        button.isHidden = true
        return button
    }()
    
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
        
        
        view.addSubview(clearButton)
        clearButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        clearButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func clearTapped(_ sender: UIButton) {
        sender.flash()
        print(#function)
    }
}

// MARK: ARBottomControlsDelegate
extension ARViewController: ARBottomControlsDelegate {
  
    
    func doneTapped() {
        print(#function)
    }
    
    func plusTapped() {
        clearButton.isHidden = false
        print(#function)
    }
    
    func undoTapped() {
        print(#function)
    }
    
    func backTapped() {
        dismiss(animated: true)
    }
}
