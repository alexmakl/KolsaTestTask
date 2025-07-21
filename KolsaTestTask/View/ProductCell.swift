//
//  ProductCell.swift
//  KolsaTestTask
//
//  Created by Alexander on 21.07.2025.
//

import UIKit

final class ProductCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ProductCell"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .systemGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: ProductCellViewModel) {
        nameLabel.text = viewModel.name
        priceLabel.attributedText = viewModel.attributedPrice
    }
    
    // MARK: private
    
    private func setupViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        
        nameLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        priceLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        nameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        priceLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -16),
            
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

