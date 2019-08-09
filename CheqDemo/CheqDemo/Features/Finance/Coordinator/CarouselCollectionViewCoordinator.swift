//
//  CarouselCollectionViewCoordinator.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 8/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit
import Charts

class CarouselCollectionViewCoordinator: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {

    let theme = PrimaryTheme()
    var collectionView: UICollectionView?
    var delegate: ChartCollectionViewCoordinatorDelegate?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = String(describing: CarouselCollectionViewCell.self)
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
        delegate?.selectedCell(indexPath, collectionView: collectionView)
    }
}

extension CarouselCollectionViewCoordinator: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        var size = CGSize(width: 0, height: 0)
//        switch (collectionView.traitCollection.horizontalSizeClass) {
//        case .compact:
//            size = CarouselCollectionViewCell.compactSize
//        case .regular:
//            size = CarouselCollectionViewCell.regularSize
//        case .unspecified:
//            size = CarouselCollectionViewCell.anySize
//        @unknown default:
//            // detect unhandle trait class before getting out to production
//            fatalError("support new enum type")
//        }
//        return size
//    }
}

extension CarouselCollectionViewCoordinator: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard let collectionView = collectionView else { return }

        // center cells 
    }
}

