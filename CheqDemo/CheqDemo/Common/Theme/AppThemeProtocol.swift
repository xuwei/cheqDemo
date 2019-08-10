//
//  AppThemeProtocol.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 7/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit

// by adopting AppThemeProtocol protocol, we can create different ui themes for the app
protocol AppThemeProtocol {

    //MARK: fonts
    var defaultFont: UIFont { get }
    var mediumFont: UIFont { get }
    var headerFont: UIFont { get }

    //MARK: colors
    var textColor: UIColor { get }
    var linksColor: UIColor { get }
    var primaryColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var textBackgroundColor: UIColor { get }
    var alternativeColor1: UIColor { get }
    var alternativeColor2: UIColor { get }
    var alternativeColor3: UIColor { get }
    var alternativeColor4: UIColor { get }

    //MARK: gradients
    var gradientBlueSet: [UIColor] { get }
    var gradientOrangeSet: [UIColor] { get }
    var gradientGreenSet: [UIColor] { get }
    func allBgColors()-> [UIColor]

    //MARK: animations
    var longAnimationDuration: TimeInterval { get }
    var mediumAnimationDuration: TimeInterval { get }
    var quickAnimationDuration: TimeInterval { get }

    //MARK: styling logics
    var padding: CGFloat { get }
    func cardStyling(_ view: UIView, bgColors: [UIColor])
    func cardStyling(_ view: UIView, bgColor: UIColor)
    func collectionViewPadding(_ collectionView: UICollectionView, cellLength: CGFloat, direction: ScrollDirection)
}
