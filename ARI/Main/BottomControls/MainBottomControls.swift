//
//  BottomControls.swift
//  ARI
//
//  Created by Maxim Spiridonov on 17/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit


protocol BottomControlsDelegate: class {
    func bottomControlActions(buttonName: String)
}

class MainBottomControls: UIView {
    
    weak var delegate: BottomControlsDelegate?
    
    let accountButton: UIButton = {
        var button = UIButton.getCustomtButton(imageName: "account")
        button.addTarget(self, action: #selector(settingsTapped), for: .touchUpInside)
        return button
    }()
    
    
    let searchButton: UIButton = {
        let button = UIButton.getCustomtButton(imageName: "search")
        button.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
        return button
    }()
    
    let plusButton: UIButton = {
        let button = UIButton.getCustomtButton(imageName: "plus")
        button.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        setupUI()
    }
    
    @objc func settingsTapped(_ sender: UIButton) {
        sender.flash()
        delegate?.bottomControlActions(buttonName: "account")
    }
    
    @objc func searchTapped(_ sender: UIButton) {
        sender.flash()
        delegate?.bottomControlActions(buttonName: "search")
    }
    
    @objc func plusTapped(_ sender: UIButton) {
        sender.flash()
        delegate?.bottomControlActions(buttonName: "plus")
    }
    
    private func setupUI() {
        overlayFirstLayer()
    }
    
    private func overlayFirstLayer() {
        addSubview(accountButton)
        accountButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        accountButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        accountButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        accountButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(searchButton)
        searchButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(plusButton)
        plusButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        plusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
