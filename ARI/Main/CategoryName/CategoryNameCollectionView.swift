
//
//  CategoryNameCollectionView.swift
//  ARI
//
//  Created by Maxim Spiridonov on 22/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit



struct CategoryNameViewModel {
    var label: String
    var isActive: Bool
}

protocol CategoryNameCollectionViewDelegate: class {
    func currentSection(indexPage: Int)
}


class CategoryNameCollectionView: UICollectionView {

    weak var categoryDelegate: CategoryNameCollectionViewDelegate?
    var cells = [CategoryNameViewModel(label: "Стены", isActive: true),
                CategoryNameViewModel(label: "Полы", isActive: false),
                CategoryNameViewModel(label: "Мебель", isActive: false),
                CategoryNameViewModel(label: "Декор", isActive: false),
                CategoryNameViewModel(label: "Ванная", isActive: false)]

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
        contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 60)
    }
    
    func resetColorLabel() {
        
    }
    
    func setColor(index: Int) {
        
        // hack
        let lastPageIndex = cells.indices.filter { cells[$0].isActive == true }.first!
        cells[lastPageIndex].isActive = false
        cells[index].isActive = true
        let indexPath = IndexPath(row: index, section: 0)
        scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension CategoryNameCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CategoryNameCollectionViewCell.reuseId, for: indexPath) as! CategoryNameCollectionViewCell
        cell.set(viewModel: cells[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        setColor(index: indexPath.row)
        categoryDelegate?.currentSection(indexPage: indexPath.row)
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension CategoryNameCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return UILabel.getLabelSize(text: cells[indexPath.row].label, fontSize: 26, fontName: "TTNorms-Bold")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }

}
