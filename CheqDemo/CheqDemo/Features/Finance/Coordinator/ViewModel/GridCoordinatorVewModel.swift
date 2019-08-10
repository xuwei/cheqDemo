//
//  GridCellVewModel.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 10/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit

class GridCoordinatorVewModel: NSObject, BaseViewModel {

    var pieChartModels: [ChartModel] = []

    override init() {
        super.init()

    }

    func load(_ complete: @escaping () -> Void) {
        // load data for grid
        self.pieChartModels = ChartModelUtil.fakePieChartModel()
        complete()
    }
}
