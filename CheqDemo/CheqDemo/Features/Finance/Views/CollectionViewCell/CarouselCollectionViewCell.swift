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
        setupChart()
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

    func setupChart() {
        self.barView = CBarChartView(frame: self.contentView.frame)
        self.contentView.addSubview(barView)
        AutoLayoutUtil.pinToSuperview(self.barView, padding: 0.0)
    }

    func animate() {
        self.barView.animate(yAxisDuration: theme.mediumAnimationDuration, easingOption: .easeInOutBounce)
    }
}
