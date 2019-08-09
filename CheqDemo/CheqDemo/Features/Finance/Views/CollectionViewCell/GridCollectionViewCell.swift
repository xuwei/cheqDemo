//
//  GridCollectionViewCell.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 8/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit
import Charts

class GridCollectionViewCell: UICollectionViewCell {

    var pie: PieChartView = PieChartView()
    let theme = PrimaryTheme()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.bounds = self.frame
        theme.cardStyling(self, bgColor: theme.textBackgroundColor)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = .orange
        self.setup { view in
            self.pie = view as! PieChartView
            self.pie.rotationWithTwoFingers = false
            self.pie.rotationEnabled = false
            self.pie.entryLabelFont = theme.defaultFont
            self.pie.entryLabelColor = theme.textColor
            self.pie.drawHoleEnabled = true
            self.pie.drawCenterTextEnabled = true
            self.pie.legend.verticalAlignment = .center
            self.pie.legend.horizontalAlignment = .center
            self.pie.legend.drawInside = true 
            self.pie.drawMarkers = false
            self.contentView.addSubview(pie)
            AutoLayout.pinToSuperview(pie, padding: 10.0)
            pie.data = loadData()
        }
    }

    func loadData()-> PieChartData {

        var entries: [PieChartDataEntry] = Array()
        let entry = PieChartDataEntry(value: 0.21, label: "$21")
        let entry2 = PieChartDataEntry(value: 0.79, label: "")
        

        entries.append(entry2)
        entries.append(entry)
        let dataSet = PieChartDataSet(entries: entries, label: "Household")
        dataSet.drawIconsEnabled = false
        dataSet.automaticallyDisableSliceSpacing = true
        let data = PieChartData(dataSet: dataSet)
        dataSet.colors = GradientView.randGradientSet()
        dataSet.valueTextColor = .clear
        return data
    }
}

extension GridCollectionViewCell: ChartCollectionViewCellProtocol {
    
    static var compactSize: CGSize {
        return CGSize(width: 100.0, height: 100.0)
    }

    static var regularSize: CGSize {
        return CGSize(width: 120.0, height: 120.0)
    }

    static var anySize: CGSize {
        return CGSize(width: 150.0, height: 150.0)
    }

    func setup(completion: (UIView) -> Void) {
        let chart = PieChartView(frame: self.contentView.frame)
        completion(chart)
    }

    func animate() {
        self.pie.animate(yAxisDuration: 0.5, easingOption: .easeInOutBounce)
    }
}
