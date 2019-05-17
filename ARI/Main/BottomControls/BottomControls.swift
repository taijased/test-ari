//
//  BottomControls.swift
//  ARI
//
//  Created by Maxim Spiridonov on 17/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

class BottomControls: UIView {
    
    
    
    

    // первый
    
    let settingsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexValue: "#EE8C75", alpha: 1)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        view.layer.shadowRadius = 4.0
        view.layer.shadowOpacity = 0.3
        view.layer.cornerRadius = view.frame.width / 2
        view.layer.masksToBounds = false
    
        return view
    }()
    
    
    let searchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()
    
    let plusView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    // второй слой
    
    let settingsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "settings")
        return imageView
    }()
    
    let searchImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "search")
        return imageView
    }()
    
    let plusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "plus")
        return imageView
    }()
    
    
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        


        setupUI()
    }
    
    private func setupUI() {
       
        overlayFirstLayer()
        overlaySecondLayer()
        
    }
    
    private func overlayFirstLayer() {
        addSubview(settingsView)
        settingsView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        settingsView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        settingsView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        settingsView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(searchView)
        searchView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        searchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -120).isActive = true
        searchView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        searchView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(plusView)
        plusView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        plusView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60).isActive = true
        plusView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        plusView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    private func overlaySecondLayer() {

        settingsView.addSubview(settingsImage)
        searchView.addSubview(searchImage)
        plusView.addSubview(plusImage)
        
        helpInSecondLayer(view: settingsView, imageView: settingsImage)
        helpInSecondLayer(view: searchView, imageView: searchImage)
        helpInSecondLayer(view: plusView, imageView: plusImage)
    }
    
    private func helpInSecondLayer(view: UIView, imageView: UIImageView) {
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
