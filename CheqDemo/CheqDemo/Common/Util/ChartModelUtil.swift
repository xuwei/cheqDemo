//
//  ChartModelUtil.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 9/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit
import Foundation
import Charts

struct ChartModelUtil {
    static func fakeChartModel()-> ChartModel {
        return ChartModel(title: "hello", type: 0, dataSet: ["" : 0])
    }
}

