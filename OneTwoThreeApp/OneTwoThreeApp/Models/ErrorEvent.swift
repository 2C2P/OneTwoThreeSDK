//
//  ErrorEvent.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 24/6/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import UIKit

enum ErrorEvent: Error {
    case request
    case response
    case missingParams
    case custom(message:String?)
    
    var localizedDescription: String {
        switch self {
        case .request:              return "Request Error"
        case .response:             return "Response Error"
        case .missingParams:        return "Missing parameters"
        case .custom(let message):
            return message ?? "Unknown Error"
        }
    }
}

