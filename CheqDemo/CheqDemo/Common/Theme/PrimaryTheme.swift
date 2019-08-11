//
//  PrimaryTheme.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 8/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit
import Hex

enum CollectionViewType {
    case carousel, grid
}

// this is an implementation of AppThemeProtocol
// we can create more for different themes. e.g. DarkModeTheme, CBATheme, etc

//MARK: collection styling logics
struct PrimaryTheme: AppThemeProtocol {

    var gridCellToScreenRatio: CGFloat { get { return 0.35 } }
    var carouselCellWidthToScreenRatio: CGFloat { get { return 0.6 } }
    var carouselCellHeightToScreenRatio: CGFloat { get { return 0.25 } }

    func cardStyling(_ view: UIView, bgColor: UIColor) {
        view.backgroundColor = bgColor
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 20.0
        view.layer.shadowPath =
            UIBezierPath(roundedRect: view.layer.bounds,
                         cornerRadius: view.layer.cornerRadius).cgPath
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowRadius = view.layer.cornerRadius / 2.0
    }

    func cardStyling(_ view: UIView, bgColors: [UIColor]) {
        // setup gradient layer
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
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    func allBgColors()-> [UIColor] {
        return [alternativeColor1, alternativeYellowColor, alternativeYellowColor, alternativeColor2, alternativeColor3, alternativeColor4]
    }

    func collectionViewPadding(_ collectionView: UICollectionView, cellLength: CGFloat, collectionType: CollectionViewType) {
        switch(collectionType) {

        // for carousel
        case .carousel:
            collectionView.contentInset = UIEdgeInsets(top: padding, left: cellLength*0.25, bottom: padding, right: cellLength*0.25)

        // for grid view
        case .grid:
            collectionView.contentInset = UIEdgeInsets(top: padding, left: cellLength*0.25, bottom: padding, right: cellLength*0.25)
        }
    }

    var padding: CGFloat {
        get { return 10.0 }
    }
}

//MARK: colors
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
        get { return UIColor(hex: "FFFFFF") }
    }

    var textBackgroundColor: UIColor {
        get { return UIColor(hex: "FFFFFF")}
    }

    var textColor: UIColor {
        get { return .black }
    }

    var linksColor: UIColor {
        get { return alternativeColor3 }
    }

    var nonActiveAlpha: CGFloat { get { return 0.5 } }
}

//MARK: fonts
extension PrimaryTheme {
    var defaultFont: UIFont {
        get { return UIFont.systemFont(ofSize: 12.0)}
    }

    var mediumFont: UIFont {
        get { return UIFont.systemFont(ofSize: 15.0)}
    }

    var headerFont: UIFont {
        get { return UIFont.systemFont(ofSize: 20.0)}
    }
}

//MARK: animation variables
extension PrimaryTheme {
    var longAnimationDuration: TimeInterval { return 1.0 }
    var mediumAnimationDuration: TimeInterval { return 0.5 }
    var quickAnimationDuration: TimeInterval { return 0.25}
}
