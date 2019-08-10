//
//  GridCollectionViewCoordinator.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 8/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit

// MARK: UICollectionViewDelegate, UICollectionViewDataSource
class GridCollectionViewCoordinator: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {

    let theme = sharedAppConfig.activeTheme
    var collectionView: UICollectionView?
    var delegate: ChartCollectionViewCoordinatorDelegate?
    var viewModel: GridCoordinatorVewModel

    init(_ viewModel: GridCoordinatorVewModel) {
        self.viewModel = viewModel
        super.init()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pieChartModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = String(describing: GridCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? GridCollectionViewCell
        let chartModel = viewModel.pieChartModels[indexPath.row]
        cell?.pie.loadData(chartModel)
        return cell ?? UICollectionViewCell()
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

// MARK: UICollectionViewDelegateFlowLayout
extension GridCollectionViewCoordinator: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//    }
}
