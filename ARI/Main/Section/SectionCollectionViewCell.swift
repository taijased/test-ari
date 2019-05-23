//
//  SectionCollectionViewCell.swift
//  ARI
//
//  Created by Maxim Spiridonov on 21/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit




class SectionCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "SectionCollectionViewCell"
    
    private var categoryCollectionView = CategoryCollectionView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setupSubsection()
        set()
    }
    
    private func setupSubsection() {
        
        addSubview(categoryCollectionView)
        categoryCollectionView.fillSuperview()
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func set() {
        backgroundColor = .random()
    }
}


