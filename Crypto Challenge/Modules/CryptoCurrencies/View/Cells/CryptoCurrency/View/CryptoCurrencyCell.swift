//
//  CryptoCurrencyCell.swift
//  Crypto Challenge
//
//  Created by Victor Morei on 14.01.2022.
//

import UIKit
import CryptoAPI

class CryptoCurrencyCell: UITableViewCell {
    
    static let identifier = String(describing: CryptoCurrencyCell.self)

    private var viewModel: CryptoCurrencyCellViewModel!
    
    private let coinImageView = UIImageView()
    private let coinNameLabel = UILabel()
    private let coinCodeLabel = UILabel()
    private let minPriceLabel = UILabel()
    private let maxPriceLabel = UILabel()
    private let currentPriceLabel = UILabel()
    
    func setup(viewModel: CryptoCurrencyCellViewModel) {
        self.viewModel = viewModel
        createSubviews()
        setupBindings()
    }
}

// MARK: - Bindings
extension CryptoCurrencyCell {
    
    private func setupBindings() {
        viewModel.onPriceDidChane = self.onPriceDidChange
        viewModel.onMinPriceDidChange = self.onMinPriceDidChange
        viewModel.onMaxPriceDidChange = self.onMaxPriceDidChange
    }
    
    private func onPriceDidChange(color: UIColor) {
        UIView.transition(
            with: currentPriceLabel,
            duration: 0.8,
            options: .transitionCrossDissolve,
            animations: {
                self.currentPriceLabel.backgroundColor = color
            },
            completion: { _ in
                self.currentPriceLabel.backgroundColor = .clear
                self.currentPriceLabel.text = self.viewModel.currentPrice
            })
    }
    
    private func onMinPriceDidChange() {
        minPriceLabel.attributedText = viewModel.minPriceAttributedString
    }
    
    private func onMaxPriceDidChange() {
        maxPriceLabel.attributedText = viewModel.maxPriceAttributedString
    }
}

// MARK: - Create subviews
extension CryptoCurrencyCell {
    
    private func createSubviews() {
        setupCoinImageView()
        setupCoinNameLabel()
        setupCoinCodeLabel()
        setupMinPriceLabel()
        setupMaxPriceLabel()
        setupCurrentPriceLabel()
    }
    
    private func setupCoinImageView() {
        contentView.addSubview(coinImageView)
        coinImageView.setImage(urlString: viewModel.currency.imageUrl)
        
        coinImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(15)
            make.top.equalTo(contentView).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(coinImageView.snp.height)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
    }
    
    private func setupCoinNameLabel() {
        contentView.addSubview(coinNameLabel)
        coinNameLabel.text = viewModel.currency.name
        
        coinNameLabel.snp.makeConstraints { make in
            make.left.equalTo(coinImageView.snp.right).offset(10)
            make.top.equalTo(contentView).offset(10)
        }
    }
    
    private func setupCoinCodeLabel() {
        coinCodeLabel.text = viewModel.currency.code
        coinCodeLabel.textColor = .lightGray
        coinCodeLabel.font = .systemFont(ofSize: 16, weight: .light)
        contentView.addSubview(coinCodeLabel)
        
        coinCodeLabel.snp.makeConstraints { make in
            make.left.equalTo(coinNameLabel.snp.right).offset(15)
            make.centerY.equalTo(coinNameLabel)
        }
    }
    
    private func setupMinPriceLabel() {
        minPriceLabel.attributedText = viewModel.minPriceAttributedString
        contentView.addSubview(minPriceLabel)
        
        minPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(coinImageView.snp.right).offset(10)
            make.bottom.equalTo(contentView).offset(-5)
        }
    }
    
    private func setupMaxPriceLabel() {
        maxPriceLabel.attributedText = viewModel.maxPriceAttributedString
        contentView.addSubview(maxPriceLabel)
        
        maxPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(minPriceLabel.snp.right).offset(15)
            make.centerY.equalTo(minPriceLabel)
        }
    }
    
    private func setupCurrentPriceLabel() {
        currentPriceLabel.text = viewModel.currentPrice
        contentView.addSubview(currentPriceLabel)
        currentPriceLabel.layer.cornerRadius = 5
        currentPriceLabel.layer.masksToBounds = true
        
        currentPriceLabel.snp.makeConstraints { make in
            make.right.equalTo(contentView).offset(-15)
            make.centerY.equalTo(contentView)
            make.height.equalTo(30)
        }
    }
}
