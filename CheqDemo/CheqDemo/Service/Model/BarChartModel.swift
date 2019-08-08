//
//  BarChartModel.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 8/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit

struct BarChartModel: Decodable {
    let title: String 
    let dataSet: [String: Decimal]
}
