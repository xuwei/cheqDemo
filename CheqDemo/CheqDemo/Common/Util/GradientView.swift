//
//  GradientView.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 9/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit

struct GradientView {

    static func randAlternateColor()->UIColor {
        let theme = PrimaryTheme()
        let colors = [theme.alternativeColor1, theme.alternativeColor2, theme.alternativeColor3, theme.alternativeColor4]
        return colors.randomElement() ?? theme.alternativeColor1
    }

    static func randGradientSet()->[UIColor] {
        let theme = PrimaryTheme()
        let gradients = [theme.gradientBlueSet, theme.gradientGreenSet, theme.gradientOrangeSet]
        let randIndex = Int.random(in: 0..<gradients.count) % gradients.count
        let selectedGradient = gradients[randIndex]
        return selectedGradient
    }
}
