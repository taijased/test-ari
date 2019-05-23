//
//  ReadySolutionCollectionView
//  ARI
//
//  Created by Maxim Spiridonov on 21/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit


struct ReadySolutionViewModel {
    var iconUrlString: String
    var name: String
}

class ReadySolutionCollectionView: UICollectionView {
    
    var cells = [ReadySolutionViewModel(iconUrlString: "https://kor.ill.in.ua/m/610x385/1804612.jpg", name: "Кухня в стиле Flat"),
                ReadySolutionViewModel(iconUrlString: "https://kor.ill.in.ua/m/610x385/1804612.jpg", name: "Минималистичный зал"),
                ReadySolutionViewModel(iconUrlString: "https://kor.ill.in.ua/m/610x385/1804612.jpg", name: "Уютная спальня"),
                ReadySolutionViewModel(iconUrlString: "https://kor.ill.in.ua/m/610x385/1804612.jpg", name: "Светлая ванная")]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .clear
        setupCollectionSettings()
        
    }
    
    
    
    func set(cells: [ReadySolutionViewModel]) {
        self.cells = cells
    }
    
    private func setupCollectionSettings() {
        delegate = self
        dataSource = self
        register(ReadySolutionCollectionViewCell.self, forCellWithReuseIdentifier: ReadySolutionCollectionViewCell.reuseId)
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
extension ReadySolutionCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ReadySolutionCollectionViewCell.reuseId, for: indexPath) as! ReadySolutionCollectionViewCell
        cell.set(viewModel: cells[indexPath.row])
        return cell
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout

extension ReadySolutionCollectionView: UICollectionViewDelegateFlowLayout {
    
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

