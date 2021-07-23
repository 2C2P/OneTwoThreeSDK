//
//  Validator.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 1/7/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import Foundation

class Validator: NSObject {
    
    static func validateEnvPasscode(passcode: String) -> Bool {
        guard !passcode.isEmpty, passcode.count == 6 else {
            return false
        }
        let postfix = passcode.dropFirst(4)
        let month = Date().add(months: 3)?.formatted(format: "MM") ?? ""
        return postfix == month
    }
}
