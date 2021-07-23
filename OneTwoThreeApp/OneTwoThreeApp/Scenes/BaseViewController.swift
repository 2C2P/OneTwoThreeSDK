//
//  BaseViewController.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 24/6/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackButton()
        setTransparentNavigationBar()
    }

    func setTransparentNavigationBar(tintColor: UIColor = Colors.darkGreen.value) {
        navigationController?.setTransparentNavigationBar(tintColor: tintColor)
    }
    
    func setNavigationBar(tintColor: UIColor = Colors.darkGreen.value, backgroundColor: UIColor, isTranslucent: Bool = false) {
        navigationController?.setNavigationBar(tintColor: tintColor, backgroundColor: backgroundColor, isTranslucent: isTranslucent)
    }
    
    func setBackButton(tintColor: UIColor = Colors.darkGreen.value) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(onBackPressed))
    }
    
    func setCustomRightBarButton(title: String) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(onCustomRightBarButtonPressed))
            //.menuButton(self, action: #selector(onCustomRightBarButtonPressed), imageName: imageName, size: 44.0)
    }
    
    
    @objc func onBackPressed() {
        // TODO: implement in subclass
    }
    
    @objc func onCustomRightBarButtonPressed() {
        // TODO: implement in subclass
    }
    
}
