//
//  CBarChartView.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 10/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit
import Charts

class CBarChartView: BarChartView {

    let theme = sharedAppConfig.activeTheme

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConfig()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupConfig()
    }
}

// MARK: CChartViewProtocol
extension CBarChartView: CChartViewProtocol {
    func setupConfig() {
        self.extraBottomOffset = theme.padding
        self.legend.yOffset = theme.padding
        self.rightAxis.enabled = false
        self.xAxis.enabled = true
        self.leftAxis.enabled = false
        self.gridBackgroundColor = .clear
        self.drawBarShadowEnabled = false
        self.xAxis.labelTextColor = theme.textColor
        self.xAxis.drawAxisLineEnabled = false
        self.xAxis.drawGridLinesEnabled = false
        self.legend.textColor = theme.textColor
        self.legend.font = theme.defaultFont
        self.legend.verticalAlignment = .top
//        self.xAxis.valueFormatter = CBarChartFormatter()
        self.xAxis.labelPosition =  .bottom
        self.pinchZoomEnabled = false
        self.doubleTapToZoomEnabled = false
    }

    func loadData(_ chartModel: ChartModel) {
        guard chartModel.type == .bar else { return }
//        let entries: [ChartDataEntry] = chartModel.dataSet.map{ (key, value) in
//            BarChartDataEntry(x: key, y: value)
//        }

        let entries: [ChartDataEntry] = chartModel.dataSet.map { (arg: (key: String, value: Any)) -> ChartDataEntry in
            let (key, value) = arg
            let k = Double(key)!
            let v = value as! Double
            return BarChartDataEntry(x: k, y: v)
        }
        let dataSet = BarChartDataSet(entries: entries, label: chartModel.title)
        dataSet.setColor(theme.textBackgroundColor.withAlphaComponent(theme.nonActiveAlpha))
        dataSet.highlightColor = theme.textBackgroundColor
        dataSet.valueTextColor = theme.textColor
        dataSet.valueFont = theme.mediumFont
        let data = BarChartData(dataSet: dataSet)
        self.data = data
    }
}
