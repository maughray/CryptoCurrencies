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
    
    func setup() {
        setupUI()
        coinNameLabel.text = "Bitcoin"
        coinCodeLabel.text = "BTC"
        
        setMinPrice(value: 43556)
        setMaxPrice(value: 46556)
        setCurrentPrice(value: 44556)
    }
    
    private func setCurrentPrice(value: Float) {
        currentPriceLabel.text = " $\(value) "
    }
    
    private func setMinPrice(value: Float) {
        setPrice(value: value, for: minPriceLabel, prefix: "min:")
    }
    
    private func setMaxPrice(value: Float) {
        setPrice(value: value, for: maxPriceLabel, prefix: "max:")
    }
    
    private func setPrice(value: Float, for label: UILabel, prefix: String) {
        let priceText = "$\(value)"
        let attributed = NSMutableAttributedString(string: "\(prefix) \(priceText)")
        attributed.setFont(.systemFont(ofSize: 10, weight: .light), forText: prefix)
        attributed.setFont(.systemFont(ofSize: 12, weight: .regular), forText: priceText)
        attributed.setColor(color: .lightGray, forText: prefix)
        attributed.setColor(color: .black, forText: priceText)
        label.attributedText = attributed
    }
}

// MARK: - Setup UI
extension CryptoCurrencyCell {
    
    private func setupUI() {
        setupCoinImageView()
        setupCoinNameLabel()
        setupCoinCodeLabel()
        setupMinPriceLabel()
        setupMaxPriceLabel()
        setupCurrentPriceLabel()
    }
    
    private func setupCoinImageView() {
        coinImageView.backgroundColor = .red
        contentView.addSubview(coinImageView)
        coinImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(15)
            make.top.equalTo(contentView).offset(5)
            make.width.equalTo(coinImageView.snp.height)
            make.bottom.equalTo(contentView.snp.bottom).offset(-5)
        }
    }
    
    private func setupCoinNameLabel() {
        contentView.addSubview(coinNameLabel)
        
        coinNameLabel.snp.makeConstraints { make in
            make.left.equalTo(coinImageView.snp.right).offset(10)
            make.top.equalTo(contentView).offset(5)
        }
    }
    
    private func setupCoinCodeLabel() {
        coinCodeLabel.textColor = .lightGray
        coinCodeLabel.font = .systemFont(ofSize: 16, weight: .light)
        contentView.addSubview(coinCodeLabel)
        
        coinCodeLabel.snp.makeConstraints { make in
            make.left.equalTo(coinNameLabel.snp.right).offset(15)
            make.top.equalTo(contentView).offset(5)
        }
    }
    
    private func setupMinPriceLabel() {
        contentView.addSubview(minPriceLabel)
        
        minPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(coinNameLabel.snp.bottom).offset(5)
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
        currentPriceLabel.backgroundColor = .red
        currentPriceLabel.layer.cornerRadius = 5
        currentPriceLabel.layer.masksToBounds = true
        currentPriceLabel.textColor = .white
        
        currentPriceLabel.snp.makeConstraints { make in
            make.right.equalTo(contentView).offset(-15)
            make.centerY.equalTo(contentView)
            make.height.equalTo(30)
        }
    }
}
