//
//  DateExtension.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 29/6/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import Foundation

extension Date {
    
    func add(seconds: Int = 0, minutes: Int = 0, hours: Int = 0, days: Int = 0, months: Int = 0, years: Int = 0) -> Date? {
        var dateComponent = DateComponents()
        dateComponent.month = months
        dateComponent.day = days
        dateComponent.year = years
        dateComponent.hour = hours
        dateComponent.minute = minutes
        dateComponent.second = seconds
        
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(byAdding: dateComponent, to: self)
    }
    
    func formatted(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        return dateFormatter.string(from: self)
    }
}
