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

    var pie = CPieChartView()
    let theme = sharedAppConfig.activeTheme
    @IBOutlet var title: UILabel! 

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.bounds = self.frame
        theme.cardStyling(self, bgColor: theme.textBackgroundColor)
        self.title.textColor = theme.textColor
        self.title.font = theme.defaultFont
        self.title.text = "$644\n21%"
        self.contentView.bringSubviewToFront(self.title)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupChart()
    }
}

// MARK: ChartCollectionViewCellProtocol
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

    func setupChart() {
        self.pie = CPieChartView(frame: self.contentView.frame)
        self.contentView.addSubview(pie)
        AutoLayoutUtil.pinToSuperview(pie, padding: 0.0)
    }

    func animate() {
        self.pie.animate(yAxisDuration: 0.5, easingOption: .easeInOutBounce)
    }
}
