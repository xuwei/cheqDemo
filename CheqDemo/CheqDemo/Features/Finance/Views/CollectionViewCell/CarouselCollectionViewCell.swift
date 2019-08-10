//
//  CarouselCollectionView.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 8/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit
import Charts

class CarouselCollectionViewCell: UICollectionViewCell {

    let theme = sharedAppConfig.activeTheme
    var barView = CBarChartView()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.bounds = self.frame
        theme.cardStyling(self, bgColors: ColorUtil.randGradientSet())
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = .purple
        setup { [weak self] view in
            guard let self = self else { return }
            self.barView = view as! CBarChartView
            self.contentView.addSubview(barView)
            AutoLayoutUtil.pinToSuperview(self.barView, padding: 0.0)
            self.barView.data = loadData()
        }
    }

    func loadData()-> BarChartData {
        var entries: [ChartDataEntry] = Array()
        entries.append(BarChartDataEntry(x: 0, y: 467))
        entries.append(BarChartDataEntry(x: 1, y: 812))
        entries.append(BarChartDataEntry(x: 2, y: 634))
        entries.append(BarChartDataEntry(x: 3, y: 712))
        let dataSet = BarChartDataSet(entries: entries, label: "Comm Bank")
        dataSet.setColor(theme.textBackgroundColor.withAlphaComponent(0.5))
        dataSet.highlightColor = theme.textBackgroundColor
        dataSet.valueTextColor = theme.textColor
        dataSet.valueFont = theme.mediumFont
        let data = BarChartData(dataSet: dataSet)
        return data
    }
}

// MARK: ChartCollectionViewCellProtocol
extension CarouselCollectionViewCell: ChartCollectionViewCellProtocol {

    static var compactSize: CGSize {
        return CGSize(width: 200.0, height: 150.0)
    }

    static var regularSize: CGSize {
        return CGSize(width: 300.0, height: 200.0)
    }

    static var anySize: CGSize {
        return CGSize(width: 400.0, height: 300.0)
    }

    func setup(completion: (UIView) -> Void) {
        let chart = CBarChartView(frame: self.contentView.frame)
        chart.xAxis.labelCount = 4
        completion(chart)
    }

    func animate() {
        self.barView.animate(yAxisDuration: 0.5, easingOption: .easeInOutBounce)
    }
}
