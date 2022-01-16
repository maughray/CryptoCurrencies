//
//  CurrencyDetailsViewController.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import UIKit
import SnapKit
import SwiftCharts

class CurrencyDetailsViewController: UIViewController {
    
    private var viewModel: CurrencyDetailsViewModel
    
    private lazy var titleLabel = UILabel()
    private lazy var currencyImageView = UIImageView()
    private var chartView: CryptoChartView!
    
    init(viewModel: CurrencyDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        super.loadView()
        createSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}

// MARK: - Create subviews
extension CurrencyDetailsViewController {
    
    private func createSubviews() {
        view.backgroundColor = .white
        setupImageView()
        setupTitleLabel()
        setupChartView()
    }
    
    private func setupImageView() {
        currencyImageView.image = UIImage(named: viewModel.currency.imageName)
        view.addSubview(currencyImageView)
        
        currencyImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.left.equalTo(view).offset(15)
            make.height.equalTo(40)
            make.width.equalTo(currencyImageView.snp.height)
        }
    }
    
    private func setupTitleLabel() {
        titleLabel.text = viewModel.currency.name
        titleLabel.font = .systemFont(ofSize: 26, weight: .medium)
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(currencyImageView)
            make.left.equalTo(currencyImageView.snp.right).offset(10)
        }
    }
    
    private func setupChartView() {
        chartView = CryptoChartView(currency: viewModel.currency)
        view.addSubview(chartView)
        
        chartView.snp.makeConstraints { make in
            make.top.equalTo(currencyImageView.snp.bottom).offset(10)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
    }
}
