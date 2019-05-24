//
//  ARBottomControls.swift
//  ARI
//
//  Created by Maxim Spiridonov on 24/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import Foundation


import UIKit


protocol ARBottomControlsDelegate: class {
    func doneTapped()
    func plusTapped()
    func undoTapped()
    func backTapped()
}

class ARBottomControls: UIView {
    
    weak var delegate: ARBottomControlsDelegate?
    
    let doneButton: UIButton = {
        var button = UIButton.getCustomtButton(imageName: "done")
        button.addTarget(self, action: #selector(doneTapped), for: .touchUpInside)
        button.backgroundColor = UIColor(hexValue: "#4AB56D", alpha: 1)
        return button
    }()
    
    
    let plusButton: UIButton = {
        let button = UIButton.getCustomtButton(imageName: "plus")
        button.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        return button
    }()
    
    let undoButton: UIButton = {
        let button = UIButton.getCustomtButton(imageName: "undo")
        button.addTarget(self, action: #selector(undoTapped), for: .touchUpInside)
        button.backgroundColor = UIColor(hexValue: "#4A90E2", alpha: 1)
        button.isHidden = true
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton.getCustomtButton(imageName: "arrow-left")
        button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        setupUI()
    }
    
    @objc func doneTapped(_ sender: UIButton) {
        sender.flash()
        delegate?.doneTapped()
    }
    
    @objc func plusTapped(_ sender: UIButton) {
        sender.flash()
        undoButton.isHidden = false
        delegate?.plusTapped()
    }
    
    @objc func undoTapped(_ sender: UIButton) {
        sender.flash()
        delegate?.undoTapped()
    }
    
    @objc func backTapped(_ sender: UIButton) {
        sender.flash()
        delegate?.backTapped()
    }
    
    private func setupUI() {
        overlayFirstLayer()
    }
    
    private func overlayFirstLayer() {
        addSubview(doneButton)
        doneButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: Constants.bottomSize).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: Constants.bottomSize).isActive = true
        
        addSubview(plusButton)
        plusButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: Constants.bottomSize).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: Constants.bottomSize).isActive = true
        
        addSubview(undoButton)
        undoButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        undoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -130).isActive = true
        undoButton.widthAnchor.constraint(equalToConstant: Constants.bottomSize).isActive = true
        undoButton.heightAnchor.constraint(equalToConstant: Constants.bottomSize).isActive = true
        
        addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: Constants.bottomSize).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: Constants.bottomSize).isActive = true
  
        
    }
    
    
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
