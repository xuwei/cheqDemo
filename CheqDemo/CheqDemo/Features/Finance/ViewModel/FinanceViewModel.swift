//
//  FinanceViewModel.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 7/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit
import PromiseKit

class FinanceViewModel: NSObject, BaseViewModel {

    let title: String
    let filters = FinancialPeriod.AllCases()
    var carouselCoordViewModel = CarouselCoordinatorViewModel()
    var gridCoordViewModel = GridCoordinatorVewModel()

    init(_ title: String) {
        self.title = title
    }

    func load(_ complete: () -> Void) {
        carouselCoordViewModel.load {
            gridCoordViewModel.load {
                complete()
            }
        }
    }
}
