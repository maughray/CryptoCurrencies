//
//  CurrencyDetailsViewController.swift
//  Crypto Challenge
//
//  Created by maughray on 1/15/22.
//

import UIKit
import SnapKit

class CurrencyDetailsViewController: UIViewController {
    
    private var viewModel: CurrencyDetailsViewModel
    
    private lazy var titleLabel = UILabel()
    private lazy var currencyImageView = UIImageView()
    
    init(viewModel: CurrencyDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}

// MARK: - Setup UI
extension CurrencyDetailsViewController {
    
    private func setupUI() {
        view.backgroundColor = .white
        setupImageView()
        setupTitleLabel()
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
}
