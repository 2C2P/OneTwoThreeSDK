//
//  StringExtension.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 23/6/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import UIKit

extension String {
    
    var cleanAmount: String {
        return replacingOccurrences(of: ",", with: "")
    }
    
    func formattedAmount(withCommas: Bool) -> String {
        guard let amount = Double(cleanAmount) else {  return self  }
        return amount.currencyFormatted(withCommas: withCommas)
    }
    
    // MARK: - Static
    
    static func random(digits: Int) -> String {
        var number = String()
        for _ in 1...digits {
           number += "\(Int.random(in: 0...9))"
        }
        return number
    }

}
