//
//  ProductListViewModel.swift
//  KolsaTestTask
//
//  Created by Alexander on 21.07.2025.
//

import Foundation

final class ProductListViewModel {
    private(set) var products: [Product] = []
    private(set) var sortType: ProductSortType = .byPrice
    
    init() {
        parseMockData()
    }
    
    func numberOfRows() -> Int {
        products.count + 1
    }
    
    func sortButtonViewModel() -> SortButtonCellViewModel {
        let title = sortType == .byName ? "Сортировать по цене" : "Сортировать по алфавиту"
        return SortButtonCellViewModel(title: title)
    }
    
    func productCellViewModel(at index: Int) -> ProductCellViewModel? {
        guard index > 0 else { return nil }
        
        let sortedProducts = sortedProductsList()
        let product = sortedProducts[index - 1]
        return ProductCellViewModel(product: product)
    }
    
    func toggleSort() {
        sortType = (sortType == .byName) ? .byPrice : .byName
    }
    
    private func parseMockData() {
        let data = Data(MockData.json.utf8)
        if let decoded = try? JSONDecoder().decode([Product].self, from: data) {
            self.products = decoded
        } else {
            self.products = []
        }
    }
    
    private func sortedProductsList() -> [Product] {
        switch sortType {
        case .byName:
            products.sorted {
                $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending
            }
        case .byPrice:
            products.sorted {
                $0.price < $1.price
            }
        }
    }
}
