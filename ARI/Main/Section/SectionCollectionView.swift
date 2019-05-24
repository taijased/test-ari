//
//  SectionCollectionView.swift
//  ARI
//
//  Created by Maxim Spiridonov on 21/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//


import UIKit

struct SectionViewModel {
    
}



protocol SectionCollectionViewDelegate: class {
    func currentPage(indexPage: Int)
    func scrollTop(_ scrollView: UIScrollView)
    func scrollBegin(_ scrollView: UIScrollView)
}


class SectionCollectionView: UICollectionView {
    
    var cells = [SectionViewModel]()
    weak var sectionDelegate: SectionCollectionViewDelegate?
    
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        setupCollectionSettings()
        backgroundColor = .white
    }
    func set(cells: [SectionViewModel]) {
        self.cells = cells
    }
    
    func scrollSection(index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private func setupCollectionSettings() {
        delegate = self
        dataSource = self
        register(SectionCollectionViewCell.self, forCellWithReuseIdentifier: SectionCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        isPagingEnabled = true

       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension SectionCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: SectionCollectionViewCell.reuseId, for: indexPath) as! SectionCollectionViewCell
        cell.set()
        cell.delegate = self
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageWidth: CGFloat = scrollView.frame.size.width
        let page: Int = Int(floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
        
        sectionDelegate?.currentPage(indexPage: page)
    }
 
}

// MARK:  UICollectionViewDelegateFlowLayout

extension SectionCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
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


// MARK:  SectionCollectionViewCellDelegate

extension SectionCollectionView: SectionCollectionViewCellDelegate {
    func scrollTop(_ scrollView: UIScrollView) {
        sectionDelegate?.scrollTop(scrollView)
    }
    
    func scrollBegin(_ scrollView: UIScrollView) {
        sectionDelegate?.scrollBegin(scrollView)
    }
}
