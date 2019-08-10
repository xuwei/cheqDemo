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

@objc(BarChartFormatter)
class BarChartFormatter:NSObject,IAxisValueFormatter{

    var months: [String]! = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return months[Int(value)]
    }
}

@objc(PieChartFormatter)
class PieChartFormatter:NSObject,IValueFormatter{
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        return String("\(value)%%")
    }
}

