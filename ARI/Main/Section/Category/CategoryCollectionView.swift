//
//  CategoryCollectionView.swift
//  ARI
//
//  Created by Maxim Spiridonov on 21/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//
import UIKit

struct CategoryViewModel {
}


protocol CategoryCollectionViewDelegate: class {
    func scrollCellTop(_ scrollView: UIScrollView)
    func scrollCellBegin(_ scrollView: UIScrollView)
}

class CategoryCollectionView: UICollectionView {
    
    var cells = [CategoryViewModel]()
    weak var categoryDelegate: CategoryCollectionViewDelegate?
    
    
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .white
        setupCollectionSettings()
        
    }
    
    
    func set(cells: [CategoryViewModel]) {
        self.cells = cells
    }
    
    private func setupCollectionSettings() {
        delegate = self
        dataSource = self
        register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 150, right: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension CategoryCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int.random(in: 15..<30)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseId, for: indexPath) as! CategoryCollectionViewCell
        cell.set(imageUrl: "https://cdn.trinixy.ru/pics5/20170922/grustniy_kot_01.jpg")
        return cell
    }


    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        categoryDelegate?.scrollCellBegin(scrollView)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            categoryDelegate?.scrollCellTop(scrollView)
        }
    }
    
    
    

}



// MARK: UICollectionViewDelegateFlowLayout
extension CategoryCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let width = (self.frame.width - 50) * 0.5
        let height = width * 0.62

        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40.0
    }
    
}




