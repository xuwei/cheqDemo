//
//  CarouselCollectionViewCoordinator.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 8/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit
import Charts

protocol CarouselCollectionViewCoordinatorDelegate {
    func updatePaginControl(_ index: Int)
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource
class CarouselCollectionViewCoordinator: NSObject, UICollectionViewDelegate, UICollectionViewDataSource  {

    let theme = sharedAppConfig.activeTheme
    var controllerView: UIView?
    var collectionView: UICollectionView?
    var delegate: ChartCollectionViewCoordinatorDelegate?
    var carouselDelegate: CarouselCollectionViewCoordinatorDelegate?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = String(describing: CarouselCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
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

// MARK: UIScrollViewDelegate
extension CarouselCollectionViewCoordinator: UIScrollViewDelegate {

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        updatePaging()
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updatePaging()
    }

    func updatePaging() {
        guard let indexPath = closestCellToCenter() else { return }
        self.carouselDelegate?.updatePaginControl(indexPath.row)
    }

    func snapToCell() {
        guard let collectionView = collectionView, let indexPath = closestCellToCenter() else { return }
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    func closestCellToCenter()->IndexPath? {
        guard let collectionView = collectionView, let view = controllerView else { return nil }
        let center = collectionView.center
        // center cell
        let indexPath = collectionView.indexPathForItem(at: view.convert(center, to: collectionView)) ?? nil
        return indexPath
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension CarouselCollectionViewCoordinator {
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//    }
}


