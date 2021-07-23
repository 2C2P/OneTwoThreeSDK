//
//  InputTextViewCell.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 29/6/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import UIKit
import OneTwoThreeSDK

protocol InputTextViewCellDelegate: AnyObject {
    func updateValue(value: String)
}

class InputTextViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: KMPlaceholderTextView!
    
    weak var delegate: InputTextViewCellDelegate?
    
    private let tvPlaceholderColor: UIColor = Colors.darkGray.value
    private var tvPlaceholderText = ""
    private let tvTextColor: UIColor = Colors.black.value
    
    private var merchantData: [MerchantData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(inputType: InputType, value: String) {
        titleLabel.text = inputType.title
        textView.delegate = self
        tvPlaceholderText = inputType.placeholder
        textView.placeholder = tvPlaceholderText
        textView.text = value
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
}

extension InputTextViewCell: UITextViewDelegate {
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if textView.textColor == tvPlaceholderColor {
            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        delegate?.updateValue(value: textView.text)
    }
}
