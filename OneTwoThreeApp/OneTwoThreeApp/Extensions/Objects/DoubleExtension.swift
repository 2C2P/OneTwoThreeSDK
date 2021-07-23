//
//  DoubleExtension.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 23/6/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import Foundation

extension Double {
    func currencyFormatted(digits: Int = 2, withCommas: Bool) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = withCommas ? .decimal : .none
        formatter.minimumFractionDigits = digits
        formatter.maximumFractionDigits = digits
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
