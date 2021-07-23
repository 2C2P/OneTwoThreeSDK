//
//  UITextFieldExtension.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 28/6/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import UIKit

extension UITextField {
    
    func textAfterUpdate(range: NSRange, string: String) -> String {
        var updatedString = ""
        if let text = self.text as NSString? {
            let afterUpdate = text.replacingCharacters(in: range, with: string)
            updatedString = afterUpdate
        }
        return updatedString
    }
    
}
