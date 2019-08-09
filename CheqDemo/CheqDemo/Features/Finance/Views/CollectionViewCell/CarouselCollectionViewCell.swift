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

    var barView: BarChartView = BarChartView()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.bounds = self.frame
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = .purple
        setup { [weak self] view in
            guard let self = self else { return }
            self.barView = view as! BarChartView
            self.barView.pinchZoomEnabled = false
            self.barView.doubleTapToZoomEnabled = false
            self.contentView.addSubview(barView)
            AutoLayout.pinToSuperview(self.barView)
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
        let data = BarChartData(dataSet: dataSet)
        return data
    }
}

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
        let chart = BarChartView(frame: self.contentView.frame)
        chart.rightAxis.enabled = false
        chart.xAxis.enabled = false
        chart.leftAxis.enabled = false
        chart.gridBackgroundColor = .clear
        completion(chart)
    }

    func animate() {
        self.barView.animate(yAxisDuration: 0.25, easingOption: .easeInOutBounce)
    }
}
