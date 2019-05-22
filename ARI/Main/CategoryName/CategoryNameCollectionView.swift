
//
//  CategoryNameCollectionView.swift
//  ARI
//
//  Created by Maxim Spiridonov on 22/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit



struct CategoryNameViewModel {
    
}

class CategoryNameCollectionView: UICollectionView {
    
    var cells = [CategoryNameViewModel]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .clear
        setupCollectionSettings()
        
    }
    
    
    
    func set(cells: [CategoryNameViewModel]) {
        self.cells = cells
    }
    
    private func setupCollectionSettings() {
        delegate = self
        dataSource = self
        register(CategoryNameCollectionViewCell.self, forCellWithReuseIdentifier: CategoryNameCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension CategoryNameCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int.random(in: 4..<9)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CategoryNameCollectionViewCell.reuseId, for: indexPath) as! CategoryNameCollectionViewCell
        cell.backgroundColor = .random()
        cell.set(label: "\(indexPath.row)")
        return cell
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout

extension CategoryNameCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}

