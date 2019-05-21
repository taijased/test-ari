//
//  TopSaleCollectionView.swift
//  ARI
//
//  Created by Maxim Spiridonov on 21/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit


struct TopSaleViewModel {
    
}

class TopSaleCollectionView: UICollectionView {
    
    var cells = [TopSaleViewModel]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .white
        setupCollectionSettings()
        
    }
    
    
    
    func set(cells: [TopSaleViewModel]) {
        self.cells = cells
    }
    
    private func setupCollectionSettings() {
        delegate = self
        dataSource = self
        register(TopSaleCollectionViewCell.self, forCellWithReuseIdentifier: TopSaleCollectionViewCell.reuseId)
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
extension TopSaleCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int.random(in: 4..<9)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: TopSaleCollectionViewCell.reuseId, for: indexPath) as! TopSaleCollectionViewCell
        cell.set(imageUrl: "https://kor.ill.in.ua/m/610x385/1804612.jpg")
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension TopSaleCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 160*1.6, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
}

