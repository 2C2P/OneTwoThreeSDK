//
//  FormHeaderView.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 23/6/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import UIKit

protocol FormHeaderViewDelegate: AnyObject {
    func onTouchProductionSwitch()
}

class FormHeaderView: UIView {
    
    @IBOutlet weak var productionLabel: UILabel!
    @IBOutlet weak var productionSwitch: UISwitch!
    
    weak var delegate: FormHeaderViewDelegate?
    fileprivate var vc: UIViewController?
    
    // MARK: - Configure
    
    func configure(viewController: UIViewController, title: String) {
        vc = viewController
        productionLabel.text = title
    }
    
    private func setSwitch(isProduction: Bool) {
        Manager.shared.production = isProduction
        productionSwitch.isOn = isProduction
        delegate?.onTouchProductionSwitch()
    }
    
    // MARK: - Actions
    
    @IBAction func onTouchProductionSwitch(_ sender: UISwitch) {
        guard sender.isOn else {
            setSwitch(isProduction: sender.isOn)
            return
        }
        
        vc?.showAlertDialogWithPasscodeField { result in
            let isProduction: Bool = Validator.validateEnvPasscode(passcode: result)
            self.setSwitch(isProduction: isProduction)
        }
    }
    
}
