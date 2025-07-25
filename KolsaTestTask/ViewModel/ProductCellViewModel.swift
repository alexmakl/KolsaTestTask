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
        attributedPrice = String(format: "%.2f", product.price).withRubleSign()
    }
}
