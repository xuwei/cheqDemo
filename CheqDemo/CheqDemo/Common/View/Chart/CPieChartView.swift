//
//  CPieChartView.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 10/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit
import Charts

class CPieChartView: PieChartView {

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
extension CPieChartView: CChartViewProtocol {

    func setupConfig() {
        self.rotationWithTwoFingers = false
        self.rotationEnabled = false
        self.rotationAngle = 0.5
        self.entryLabelFont = theme.defaultFont
        self.entryLabelColor = theme.textColor
        self.drawCenterTextEnabled = false
        self.drawHoleEnabled = true
        self.holeRadiusPercent = 0.7
        self.legend.enabled = true
        self.legend.verticalAlignment = .top
        self.legend.horizontalAlignment = .left
        self.legend.xOffset = theme.padding
        self.legend.yOffset = theme.padding
    }

    func loadData(_ chartModel: ChartModel) {
        guard chartModel.type == .pie else { return }

        // extract information from chartModel
        let title = chartModel.title
        let value = chartModel.dataSet["value"] as! Double
        let remain = chartModel.dataSet["remain"] as! Double

        // populate chartModel data to pie chart
        var entries: [PieChartDataEntry] = Array()
        let entry = PieChartDataEntry(value: value , label: "")
        let entry2 = PieChartDataEntry(value: remain, label: "")
        entries.append(entry)
        entries.append(entry2)
        let dataSet = PieChartDataSet(entries: entries, label: title)

        // customise dataset
        dataSet.drawIconsEnabled = false
        dataSet.automaticallyDisableSliceSpacing = true
        dataSet.colors = [ColorUtil.randAlternateColor(), .clear]
        dataSet.valueColors = [.clear, .clear]
        dataSet.valueFont = theme.defaultFont
        dataSet.entryLabelColor = theme.textColor
        let data = PieChartData(dataSet: dataSet)
        self.data = data
    }
}
