//
//  CustomerCell.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 28/6/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
