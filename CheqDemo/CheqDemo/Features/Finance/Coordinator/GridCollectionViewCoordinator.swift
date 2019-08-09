//
//  GridCollectionViewCoordinator.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 8/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit



class GridCollectionViewCoordinator: NSObject, UICollectionViewDelegate, UICollectionViewDataSource  {

    let theme = PrimaryTheme()
    var collectionView: UICollectionView?
    var delegate: ChartCollectionViewCoordinatorDelegate?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = String(describing: GridCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        theme.cardStyling(cell)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        let chartCell = cell as! ChartCollectionViewCellProtocol
        chartCell.animate()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if delegate != nil { delegate?.selectedCell(indexPath, collectionView: collectionView) }
    }
}

extension GridCollectionViewCoordinator: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        var size = CGSize(width: 0, height: 0)
//        switch (collectionView.traitCollection.horizontalSizeClass) {
//        case .compact:
//            size = GridCollectionViewCell.compactSize
//        case .regular:
//            size = GridCollectionViewCell.regularSize
//        case .unspecified:
//            size = GridCollectionViewCell.anySize
//        @unknown default:
//            // detect unhandle trait class before getting out to production
//            fatalError("support new enum type")
//        }
//        return size
//    }
}

