//
//  ProductListViewModel.swift
//  KolsaTestTask
//
//  Created by Alexander on 21.07.2025.
//

import Foundation

final class ProductListViewModel {
    
    var onDataUpdate: (() -> Void)?
    
    private var products: [Product] = []
    private var sortType: ProductSortType = .byPrice
    private let productService: ProductServiceProtocol
    
    init(productService: ProductServiceProtocol = MockProductService()) {
        self.productService = productService
        fetchProducts()
    }
    
    func numberOfRows() -> Int {
        products.count + 1
    }
    
    func sortButtonViewModel() -> SortButtonCellViewModel {
        let title = sortType == .byName ? "Сортировать по цене" : "Сортировать по алфавиту"
        return SortButtonCellViewModel(title: title)
    }
    
    func productCellViewModel(at index: Int) -> ProductCellViewModel? {
        let product = products[index]
        return ProductCellViewModel(product: product)
    }
    
    func toggleSort() {
        sortType = (sortType == .byName) ? .byPrice : .byName
        sortProducts()
        onDataUpdate?()
    }
    
    func product(at index: Int) -> Product? {
        products[index]
    }
    
    private func fetchProducts() {
        Task {
            do {
                let products = try await productService.fetchProducts()
                await MainActor.run {
                    self.products = products
                    self.sortProducts()
                    self.onDataUpdate?()
                }
            } catch {
                print("Ошибка: \(error)")
            }
        }
    }
    
    private func sortProducts() {
        switch sortType {
        case .byName:
            products = products.sorted {
                $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending
            }
        case .byPrice:
            products = products.sorted {
                $0.price < $1.price
            }
        }
    }
}
