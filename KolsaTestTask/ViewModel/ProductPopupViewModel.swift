//
//  ProductPopupViewModel.swift
//  KolsaTestTask
//
//  Created by Alexander on 22.07.2025.
//

import Foundation

struct ProductPopupViewModel {
    let name: String
    let description: String
    let attributedPrice: NSAttributedString
    
    init(product: Product) {
        name = product.name
        description = product.description
        attributedPrice = String(format: "%.2f", product.price).withRubleSign()
    }
}
