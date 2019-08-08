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
    var headerFont: UIFont { get }
    var primaryColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var alternativeColor: UIColor { get }
}
