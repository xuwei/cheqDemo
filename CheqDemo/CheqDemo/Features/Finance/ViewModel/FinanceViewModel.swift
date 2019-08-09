//
//  FinanceViewModel.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 7/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit

enum FinancialPeriod {
    case month
    case quarterly
    case annually

    var string: String {
        switch self {
        case .month: return "Monthly"
        case .quarterly: return "Quarterly"
        case .annually: return "Annually"
        }
    }

    static let allValues = [month, quarterly, annually]
    static let allStringValues = [month.string, quarterly.string, annually.string]
}

class FinanceViewModel: BaseViewModel {

    let title: String
    let filters = FinancialPeriod.allValues
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
        self.barChartModels.append(ChartModelUtil.fakeChartModel())
        complete()
    }
}
