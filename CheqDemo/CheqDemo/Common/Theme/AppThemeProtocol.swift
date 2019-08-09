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
    var alternativeColor: UIColor { get }

    var longAnimationDuration: TimeInterval { get }
    var mediumAnimationDuration: TimeInterval { get }
    var quickAnimationDuration: TimeInterval { get }
    
    func cardStyling(_ view: UIView)
    func collectionViewPadding(_ collectionView: UICollectionView, cellLength: CGFloat, direction: ScrollDirection)
}
