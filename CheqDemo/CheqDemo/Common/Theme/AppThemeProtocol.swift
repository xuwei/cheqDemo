//
//  AppThemeProtocol.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 7/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit

protocol AppThemeProtocol {
    var defaultFont: UIFont { get }
    var textColor: UIColor { get }
    var linksColor: UIColor { get }
    var headerFont: UIFont { get }
    var primaryColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var textBackgroundColor: UIColor { get }
    var alternativeColor1: UIColor { get }
    var alternativeColor2: UIColor { get }
    var alternativeColor3: UIColor { get }
    var alternativeColor4: UIColor { get }
    var gradientBlueSet: [UIColor] { get }
    var gradientOrangeSet: [UIColor] { get }
    var gradientGreenSet: [UIColor] { get }

    var longAnimationDuration: TimeInterval { get }
    var mediumAnimationDuration: TimeInterval { get }
    var quickAnimationDuration: TimeInterval { get }
    func allBgColors()-> [UIColor]
    func cardStyling(_ view: UIView, bgColors: [UIColor])
    func cardStyling(_ view: UIView, bgColor: UIColor)
    func collectionViewPadding(_ collectionView: UICollectionView, cellLength: CGFloat, direction: ScrollDirection)
}
