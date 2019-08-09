//
//  AutoLayout.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 9/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit

struct AutoLayout {

    static func pinToSuperview(_ view: UIView) {
        guard let superview = view.superview else { return }
        let top = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0)
        let left = NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: superview, attribute: .left, multiplier: 1.0, constant: 0)
        let right = NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: superview, attribute: .right, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: 0)
        superview.addConstraints([top, left, right, bottom])
    }
}
