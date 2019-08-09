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

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.bounds = self.frame
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = .orange
        self.setup { view in
            self.pie = view as! PieChartView
            self.pie.rotationWithTwoFingers = false
            self.pie.rotationEnabled = false 
            self.contentView.addSubview(pie)
            AutoLayout.pinToSuperview(pie)
            pie.data = loadData()
        }
    }

    func loadData()-> PieChartData {

        var entries: [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: 21.0, label: "x"))
        let dataSet = PieChartDataSet(entries: entries, label: "Household")
        let data = PieChartData(dataSet: dataSet)
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
