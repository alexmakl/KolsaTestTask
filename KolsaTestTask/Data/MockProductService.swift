//
//  MockProductService.swift
//  KolsaTestTask
//
//  Created by Alexander on 22.07.2025.
//

import Foundation

protocol ProductServiceProtocol {
    func fetchProducts() async throws -> [Product]
}

final class MockProductService: ProductServiceProtocol {
    func fetchProducts() async throws -> [Product] {
        let data = Data(MockData.json.utf8)
        return try JSONDecoder().decode([Product].self, from: data)
    }
}
