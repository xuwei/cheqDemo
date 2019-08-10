//
//  ChartModel.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 10/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit

enum ChartType: Int {
    case bar = 1
    case pie = 2
}

struct ChartModel {
    let title: String 
    let type: ChartType
    let dataSet: [String: Any]
}
