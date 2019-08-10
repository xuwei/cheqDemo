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
    let activeTheme = PrimaryTheme()

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
