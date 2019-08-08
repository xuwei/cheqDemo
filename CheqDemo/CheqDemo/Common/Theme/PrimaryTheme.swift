//
//  PrimaryTheme.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 8/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit

struct PrimaryTheme: AppThemeProtocol {
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
}
