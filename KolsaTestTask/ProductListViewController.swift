//
//  ProductListViewController.swift
//  KolsaTestTask
//
//  Created by Alexander on 21.07.2025.
//

import UIKit

final class ProductListViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private let viewModel = ProductListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

// MARK: - UICollectionViewDelegate

extension ProductListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            viewModel.toggleSort()
            collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource

extension ProductListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SortButtonCell.reuseIdentifier, for: indexPath) as? SortButtonCell else {
                return UICollectionViewCell()
            }
            
            let vm = viewModel.sortButtonViewModel()
            cell.configure(with: vm)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseIdentifier, for: indexPath) as? ProductCell else {
                return UICollectionViewCell()
            }
            
            if let vm = viewModel.productCellViewModel(at: indexPath.item) {
                cell.configure(with: vm)
            }
            return cell
        }
    }
}

// MARK: - fileprivate extension

fileprivate extension ProductListViewController {
    
    func setupUI() {
        configureViews()
        configureConstraints()
    }
    
    func configureViews() {
        view.backgroundColor = .systemBackground

        setupCollectionView()

        view.addSubview(collectionView)
    }
    
    func setupCollectionView() {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.headerMode = .none
        configuration.showsSeparators = true
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseIdentifier)
        collectionView.register(SortButtonCell.self, forCellWithReuseIdentifier: SortButtonCell.reuseIdentifier)
    }

    func configureConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
