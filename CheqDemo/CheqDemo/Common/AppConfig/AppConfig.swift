//
//  AppConfig.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 10/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit
import SwiftSpinner

let sharedAppConfig = AppConfig()

// manages the app global variables
class AppConfig {
    var themes:[AppThemeProtocol] = [PrimaryTheme(), DarkTheme()]
    var activeTheme: AppThemeProtocol = PrimaryTheme()
    var currentActiveThemeIndex = 0

    func switchTheme() {
        self.currentActiveThemeIndex = currentActiveThemeIndex + 1
        activeTheme = themes[currentActiveThemeIndex % themes.count]
    }

    func showSpinner() {
        SwiftSpinner.setTitleFont(activeTheme.headerFont)
        SwiftSpinner.setTitleColor(activeTheme.textBackgroundColor)
        SwiftSpinner.setAnimationDelay(activeTheme.quickAnimationDuration)
        SwiftSpinner.show("Loading", animated: true)
    }

    func hideSpinner() {
        SwiftSpinner.hide()
    }
}
