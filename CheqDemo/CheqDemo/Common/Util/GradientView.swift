//
//  GradientView.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 9/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit

struct GradientView {
//    static func applyGradientToCell(_ cell: UICollectionViewCell, colors: [UIColor]) {
//        guard colors.count >= 2 else { return }
//        let gradientLayer:CAGradientLayer = CAGradientLayer()
//        gradientLayer.frame.size = cell.frame.size
//        gradientLayer.colors = colors.map({ $0.cgColor })
//        //Use diffrent colors
//        cell.contentView.layer.insertSublayer(gradientLayer, at: 1)
//    }

    static func randGradientSet()->[UIColor] {
        let theme = PrimaryTheme()
        let gradients = [theme.gradientBlueSet, theme.gradientGreenSet, theme.gradientOrangeSet]
        let randIndex = Int.random(in: 0..<gradients.count) % gradients.count
        let selectedGradient = gradients[randIndex]
        return selectedGradient
    }
}
