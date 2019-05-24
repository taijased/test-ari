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
    
    let itemCellSize = CGSize(width: 250, height: 160)
    let itemCellsGap: CGFloat = 20.0
    
    var cells = [ReadySolutionViewModel(iconUrlString: "https://st.hzcdn.com/simgs/37c1030204f895c9_4-2281/home-design.jpg", name: "Кухня в стиле Flat"),
                 ReadySolutionViewModel(iconUrlString: "https://avatars.mds.yandex.net/get-pdb/467185/d48e0613-58d7-4646-9eb3-e33a848ee5e8/orig", name: "Минималистичный зал"),
                 ReadySolutionViewModel(iconUrlString: "https://kor.ill.in.ua/m/610x385/1804612.jpg", name: "Уютная спальня"),
                 ReadySolutionViewModel(iconUrlString: "https://kor.ill.in.ua/m/610x385/1804612.jpg", name: "Светлая ванная"),
                 ReadySolutionViewModel(iconUrlString: "https://avatars.mds.yandex.net/get-pdb/467185/d48e0613-58d7-4646-9eb3-e33a848ee5e8/orig", name: "Минималистичный зал"),
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
        isPagingEnabled = true
        decelerationRate = .fast
        
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
    

    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee = scrollView.contentOffset
        var indexes = indexPathsForVisibleItems
        indexes.sort()
        var index = indexes.first!
        let cell = cellForItem(at: index)!
        let position = contentOffset.x - cell.frame.origin.x
        if position > cell.frame.size.width / 2 {
            index.row = index.row + 1
        }
        scrollToItem(at: index, at: .left, animated: true )
    }
    
    
}

// MARK: UICollectionViewDelegateFlowLayout

extension ReadySolutionCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return itemCellSize
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemCellsGap
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return itemCellsGap
    }
    
}

