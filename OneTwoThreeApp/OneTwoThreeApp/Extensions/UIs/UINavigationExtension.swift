//
//  UINavigationExtension.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 24/6/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import UIKit

extension UINavigationController {
    func setTransparentNavigationBar(tintColor: UIColor = UIColor.black) {
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: tintColor]
        navigationBar.tintColor = tintColor
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.barTintColor = .clear
        view.backgroundColor = .clear
    }

    func setNavigationBar(tintColor: UIColor = UIColor.black, backgroundColor: UIColor, isTranslucent: Bool = false) {
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: tintColor]
        navigationBar.tintColor = tintColor
        navigationBar.barTintColor = backgroundColor
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = isTranslucent
        view.backgroundColor = .clear
    }
}

