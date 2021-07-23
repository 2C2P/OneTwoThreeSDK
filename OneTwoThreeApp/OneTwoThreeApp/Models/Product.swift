//
//  Product.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 23/6/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import UIKit

struct Product {
    var name: String?
    var desc: String?
    var amount: String?
    var image: UIImage?
    var formattedPrice: String {
        guard let amount = self.amount else {  return amount ?? ""  }
        return "฿\(amount.formattedAmount(withCommas: true))"
    }
}
