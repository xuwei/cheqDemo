//
//  CPieChartView.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 10/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit
import Charts

class CPieChartView: PieChartView, CChartViewProtocol {

    let theme = sharedAppConfig.activeTheme

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConfig()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupConfig()
    }

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
}
