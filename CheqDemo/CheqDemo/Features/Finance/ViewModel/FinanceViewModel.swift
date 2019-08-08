//
//  FinanceViewModel.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 7/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit
import RxSwift

struct FinanceViewModel: ViewModelProtocol {

    let barChartModels = PublishSubject<[BarChartModel]>()
    let pieChartModels = PublishSubject<[PieChartModel]>()

    func load() {
        
    }


}
