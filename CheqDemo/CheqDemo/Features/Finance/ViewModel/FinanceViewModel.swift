//
//  FinanceViewModel.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 7/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit

class FinanceViewModel: BaseViewModel {

    let title: String
    let filters = FinancialPeriod.AllCases()
    var barChartModels: [ChartModel] = []
    var pieChartModels: [ChartModel] = []

    init(_ title: String) {
        self.title = title
    }

    override func load(_ complete: () -> Void) {
        self.barChartModels.append(ChartModelUtil.fakeChartModel())
        self.barChartModels.append(ChartModelUtil.fakeChartModel())
        self.barChartModels.append(ChartModelUtil.fakeChartModel())
        self.barChartModels.append(ChartModelUtil.fakeChartModel())
        complete()
    }
}
