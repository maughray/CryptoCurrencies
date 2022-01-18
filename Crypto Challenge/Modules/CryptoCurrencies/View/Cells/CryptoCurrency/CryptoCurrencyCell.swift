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

    private lazy var coinImageView = UIImageView()
    private lazy var coinNameLabel = UILabel()
    private lazy var coinCodeLabel = UILabel()
    private lazy var minPriceLabel = UILabel()
    private lazy var maxPriceLabel = UILabel()
    private lazy var currentPriceLabel = UILabel()
    
    private var viewModel: CryptoCurrencyCellViewModel!
    
    func setup(viewModel: CryptoCurrencyCellViewModel) {
        self.viewModel = viewModel
        createSubviews()
        setupBindings()
        
        coinImageView.setImage(urlString: viewModel.currency.imageUrl)
        coinNameLabel.text = viewModel.currency.name
        coinCodeLabel.text = viewModel.currency.code
        minPriceLabel.attributedText = viewModel.minPriceAttributedString
        maxPriceLabel.attributedText = viewModel.maxPriceAttributedString
        currentPriceLabel.text = viewModel.currentPrice
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

// MARK: - Setup UI
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
        
        coinNameLabel.snp.makeConstraints { make in
            make.left.equalTo(coinImageView.snp.right).offset(10)
            make.top.equalTo(contentView).offset(10)
        }
    }
    
    private func setupCoinCodeLabel() {
        coinCodeLabel.textColor = .lightGray
        coinCodeLabel.font = .systemFont(ofSize: 16, weight: .light)
        contentView.addSubview(coinCodeLabel)
        
        coinCodeLabel.snp.makeConstraints { make in
            make.left.equalTo(coinNameLabel.snp.right).offset(15)
            make.centerY.equalTo(coinNameLabel)
        }
    }
    
    private func setupMinPriceLabel() {
        contentView.addSubview(minPriceLabel)
        
        minPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(coinImageView.snp.right).offset(10)
            make.bottom.equalTo(contentView).offset(-5)
        }
    }
    
    private func setupMaxPriceLabel() {
        contentView.addSubview(maxPriceLabel)
        maxPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(minPriceLabel.snp.right).offset(15)
            make.centerY.equalTo(minPriceLabel)
        }
    }
    
    private func setupCurrentPriceLabel() {
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
