//
//  UIViewControllerExtension.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 29/6/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlertDialog(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func showAlertDialogWithPasscodeField(completion: @escaping GenericCompletionBlock<String>) {
        let alert = UIAlertController(title: "Enter passcode", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textFieldPass) in
            textFieldPass.placeholder = "Passcode"
            textFieldPass.keyboardType = .numberPad
            textFieldPass.isSecureTextEntry = true
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            completion("")
        }
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { [weak alert] _ in
            guard let textField = alert?.textFields?.first, let passcode = textField.text, !passcode.isEmpty else {
                completion("")
                return
            }
            completion(passcode)
        }
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
