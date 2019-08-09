//
//  PrimaryTheme.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 8/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit

enum ScrollDirection {
    case horizontal, vertical
}

struct PrimaryTheme: AppThemeProtocol {

    var textColor: UIColor {
        get { return .black }
    }

    var linksColor: UIColor {
        get { return .blue }
    }

    var defaultFont: UIFont {
        get {
            return UIFont.systemFont(ofSize: 12.0)
        }
    }

    var headerFont: UIFont {
        get {
            return UIFont.boldSystemFont(ofSize: 20.0)
        }
    }

    var primaryColor: UIColor {
        get {
            return .orange
        }
    }

    var backgroundColor: UIColor {
        get {
            return .white
        }
    }

    var alternativeColor: UIColor {
        get {
            return .blue
        }
    }

    var longAnimationDuration: TimeInterval {
        return 1.0
    }

    var mediumAnimationDuration: TimeInterval {
        return 0.5
    }

    var quickAnimationDuration: TimeInterval {
        return 0.25 
    }

    func cardStyling(_ view: UIView) {
        view.layer.masksToBounds = false;
        view.layer.cornerRadius = 20.0
        view.layer.shadowPath =
            UIBezierPath(roundedRect: view.bounds,
                         cornerRadius: view.layer.cornerRadius).cgPath
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowRadius = 1
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
