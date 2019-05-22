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
        label.textColor = UIColor(red: 0.13, green: 0.13, blue: 0.16, alpha: 1)
        label.font = UIFont(name: "TTNorms-Bold", size: 26)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        // myImageView constraints
        label.fillSuperview()
    }
    
    
    func set(label: String) {
          self.label.text = label
    }
    
    
    func getSizeLabel() -> CGSize {
        return self.label.intrinsicContentSize
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
