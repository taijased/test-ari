//
//  SectionCollectionViewCell.swift
//  ARI
//
//  Created by Maxim Spiridonov on 21/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit



protocol SectionCollectionViewCellDelegate: class {
    func scrollTop(_ scrollView: UIScrollView)
    func scrollBegin(_ scrollView: UIScrollView)
}

class SectionCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "SectionCollectionViewCell"
    
    weak var delegate: SectionCollectionViewCellDelegate?
    private var categoryCollectionView = CategoryCollectionView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubsection()
        set()
    }
    
    private func setupSubsection() {
        
        addSubview(categoryCollectionView)
        categoryCollectionView.fillSuperview()
        categoryCollectionView.categoryDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func set() {
        backgroundColor = .random()
    }
}

extension SectionCollectionViewCell: CategoryCollectionViewDelegate {
    func scrollCellTop(_ scrollView: UIScrollView) {
        delegate?.scrollTop(scrollView)
    }
    
    func scrollCellBegin(_ scrollView: UIScrollView) {
         delegate?.scrollBegin(scrollView)
    }
}

