//
//  Manager.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 24/6/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import Foundation
import OneTwoThreeSDK

class Manager: NSObject {
    
    static let shared = Manager()
    
    var production: Bool = false
    
    var checksumKey: String = Constants.checksumKeyUAT
    var publicKey: String = Constants.publicKeyUAT
    var privateKey: String = Constants.privateKeyUAT
    var passphrase: String = Constants.passphraseUAT
    
    var service: OneTwoThreeSDKService {
        return OneTwoThreeSDKService(
            production: production,
            checksumKey: checksumKey,
            publicKey: publicKey,
            privateKey: privateKey,
            passphrase: passphrase
        )
    }
    
}
