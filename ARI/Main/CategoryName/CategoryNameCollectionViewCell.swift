//
//  CategoryNameCollectionViewCell.swift
//  ARI
//
//  Created by Maxim Spiridonov on 22/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

class CategoryNameCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CategoryNameCollectionViewCell"
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        // myImageView constraints
        label.fillSuperview()
    }
    

    func set(label: String?) {
        self.label.text = label
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
