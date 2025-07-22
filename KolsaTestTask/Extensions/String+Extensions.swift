//
//  String+Ext.swift
//  KolsaTestTask
//
//  Created by Alexander on 22.07.2025.
//

import UIKit

extension String {
    func withRubleSign() -> NSAttributedString {
        let priceString = "\(self) ₽"
        let attributedString = NSMutableAttributedString(string: priceString, attributes: [
            .foregroundColor : UIColor.label
        ])
        
        if let rubleRange = priceString.range(of: "₽") {
            let nsRange = NSRange(rubleRange, in: priceString)
            attributedString.addAttribute(.foregroundColor, value: UIColor.systemGray, range: nsRange)
        }
        
        return attributedString
    }
}
