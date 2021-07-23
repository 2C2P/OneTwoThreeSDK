//
//  InputTextFieldCell.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 28/6/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import UIKit

protocol InputTextFieldCellDelegate: AnyObject {
    func updateValue(value: String, type: InputType)
}

class InputTextFieldCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    private var type: InputType?
    weak var delegate: InputTextFieldCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(value: String?, type: InputType) {
        self.type = type
        
        titleLabel.text = type.title + type.isRequired
        textField.textColor = textField.isEnabled ? Colors.black.value : Colors.darkGray.value
        textField.placeholder = type.placeholder
        textField.delegate = self
        textField.text = value
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension InputTextFieldCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = textField.textAfterUpdate(range: range, string: string)
        guard let type = self.type, !newString.isEmpty else {
            return true
        }
        delegate?.updateValue(value: newString, type: type)
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
