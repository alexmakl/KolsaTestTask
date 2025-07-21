//
//  ProductCellViewModel.swift
//  KolsaTestTask
//
//  Created by Alexander on 21.07.2025.
//

import UIKit

struct ProductCellViewModel {
    let name: String
    let attributedPrice: NSAttributedString
    
    init(product: Product) {
        name = product.name
        let price = String(format: "%.2f", product.price)
        let priceString = "\(price) ₽"
        let attributedString = NSMutableAttributedString(string: priceString, attributes: [
            .foregroundColor : UIColor.label
        ])
        
        if let rubleRange = priceString.range(of: "₽") {
            let nsRange = NSRange(rubleRange, in: priceString)
            attributedString.addAttribute(.foregroundColor, value: UIColor.systemGray, range: nsRange)
        }
        
        attributedPrice = attributedString
    }
}
