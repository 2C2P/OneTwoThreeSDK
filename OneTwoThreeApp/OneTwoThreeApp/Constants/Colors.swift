//
//  Colors.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 23/6/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import UIKit

enum Colors : String {
    case black = "blackNWhiteColor"
    case white = "whiteNBlackColor"
    case darkGreen = "darkGreenColor"
    case darkGray = "darkGrayNLightGrayColor"
    case bgColor = "BGColor"
}

extension Colors {
    
    static let primaryDarkGreenColor: UIColor = #colorLiteral(red: 0, green: 0.3058823529, blue: 0.3647058824, alpha: 1)
    
    var value: UIColor {
        var color = UIColor.clear
        switch self {
        case .black:        color = UIColor(named: Colors.black.rawValue) ?? .black
        case .white:        color = UIColor(named: Colors.white.rawValue) ?? .black
        case .darkGreen:    color = UIColor(named: Colors.darkGreen.rawValue) ?? .black
        case .darkGray:     color = UIColor(named: Colors.darkGray.rawValue) ?? .black
        case .bgColor:      color = UIColor(named: Colors.bgColor.rawValue) ?? .black
        }
        return color
    }
    
    func withAlpha(alpha: CGFloat) -> UIColor {
        return self.value.withAlphaComponent(alpha)
    }
    
}
