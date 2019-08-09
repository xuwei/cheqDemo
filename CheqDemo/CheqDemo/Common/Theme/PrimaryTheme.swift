//
//  PrimaryTheme.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 8/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit
import Hex

enum ScrollDirection {
    case horizontal, vertical
}

struct PrimaryTheme: AppThemeProtocol {

    func cardStyling(_ view: UIView, bgColor: UIColor) {
        view.backgroundColor = bgColor
    }

    func cardStyling(_ view: UIView, bgColors: [UIColor]) {
        view.backgroundColor = .clear
        let gradientLayer = CAGradientLayer()
        gradientLayer.masksToBounds = false
        gradientLayer.frame = view.layer.bounds
        gradientLayer.colors = bgColors.map({ $0.cgColor })
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.opacity = 0.8;
        gradientLayer.cornerRadius = 20.0
        gradientLayer.shadowPath =
            UIBezierPath(roundedRect: gradientLayer.bounds,
                         cornerRadius: gradientLayer.cornerRadius).cgPath
        gradientLayer.shadowColor = UIColor.black.cgColor
        gradientLayer.shadowOpacity = 0.2
        gradientLayer.shadowOffset = CGSize(width: 5, height: 5)
        gradientLayer.shadowRadius = gradientLayer.cornerRadius / 2.0
        view.layer.masksToBounds = false
        view.layer.insertSublayer(gradientLayer, at: 0);
    }

    func allBgColors()-> [UIColor] {
        return [alternativeColor1, alternativeYellowColor, alternativeYellowColor, alternativeColor2, alternativeColor3, alternativeColor4]
    }

    func collectionViewPadding(_ collectionView: UICollectionView, cellLength: CGFloat, direction: ScrollDirection) {
        switch(direction) {
        case .horizontal:
            collectionView.contentInset = UIEdgeInsets(top: 10, left: cellLength*0.25, bottom: 10, right: cellLength*0.25)
        case .vertical:
            collectionView.contentInset = UIEdgeInsets(top: cellLength*0.25, left: 20, bottom: cellLength*0.25, right: 20)
        }
    }
}

extension PrimaryTheme {
    var gradientBlueSet: [UIColor] {
    get {
            return [alternativeColor1, alternativeColor2]
        }
    }

    var gradientOrangeSet: [UIColor] {
        get {
            return [alternativeOrangeColor, alternativeYellowColor]
        }
    }
    var gradientGreenSet: [UIColor] {
        get {
            return [alternativeColor3, alternativeColor4]
        }
    }

    var primaryColor: UIColor {
        get { return UIColor(hex: "0D80FF") }
    }

    var alternativeColor1: UIColor {
        get { return UIColor(hex: "0CAEE8") }
    }

    var alternativeColor2: UIColor {
        get { return UIColor(hex: "01FFFD") }
    }

    var alternativeColor3: UIColor {
        get { return UIColor(hex: "5FE8B1") }
    }

    var alternativeColor4: UIColor {
        get { return UIColor(hex: "55FAFF") }
    }

    var alternativeOrangeColor: UIColor {
        get { return UIColor(hex: "FF8C3B")}
    }

    var alternativeYellowColor: UIColor {
        get { return UIColor(hex: "FFFD68")}
    }

    var backgroundColor: UIColor {
        get { return UIColor(hex: "E8FFFF") }
    }

    var textBackgroundColor: UIColor {
        get { return UIColor(hex: "FFFFFF")}
    }

    var textColor: UIColor {
        get { return .black }
    }

    var linksColor: UIColor {
        get { return .blue }
    }
}

extension PrimaryTheme {
    var defaultFont: UIFont {
        get { return UIFont.systemFont(ofSize: 12.0)}
    }

    var headerFont: UIFont {
        get { return UIFont.boldSystemFont(ofSize: 20.0)}
    }
}

extension PrimaryTheme {
    var longAnimationDuration: TimeInterval { return 1.0 }
    var mediumAnimationDuration: TimeInterval { return 0.5 }
    var quickAnimationDuration: TimeInterval { return 0.25}
}
