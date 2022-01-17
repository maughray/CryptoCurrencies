//
//  CryptoCurrienciesViewController.swift
//  Crypto Challenge
//
//  Created by Victor Morei on 14.01.2022.
//

import UIKit
import SnapKit

class CryptoCurrenciesViewController: UIViewController {
    
    private lazy var viewModel = CryptoCurrenciesViewModel()
    
    private lazy var tableView = UITableView()
    private lazy var titleLabel = UILabel()
    
    override func loadView() {
        super.loadView()
        createSubviews()
        setupBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}

// MARK: Bindings
extension CryptoCurrenciesViewController {
    
    private func setupBindings() {
        viewModel.onCurrenciesDidReload = self.onCurrenciesDidReload
        viewModel.onCurrencyDidUpdatePrice = self.onCurrencyDidUpdatePrice
        viewModel.onCurrencyDidUpdateMaxPrice = self.onCurrencyDidUpdateMaxPrice
        viewModel.onCurrencyDidUpdateMinPrice = self.onCurrencyDidUpdateMinPrice
    }
    
    private func onCurrenciesDidReload() {
        tableView.reloadData()
    }
    
    private func onCurrencyDidUpdatePrice(index: Int, value: Double) {
        print("\(index) price update: \(value)")
    }
    
    private func onCurrencyDidUpdateMaxPrice(index: Int, value: Double) {
        print("\(index) max price update: \(value)")
    }
    
    private func onCurrencyDidUpdateMinPrice(index: Int, value: Double) {
        print("\(index) min price update: \(value)")
    }
}

// MARK: - Create subviews
extension CryptoCurrenciesViewController {
    
    private func createSubviews() {
        view.backgroundColor = .white
        setupTitleLabel()
        setupTableView()
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "Market"
        titleLabel.font = .systemFont(ofSize: 26, weight: .medium)
        self.view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.left.equalTo(view).offset(15)
        }
    }
    
    private func setupTableView() {
        tableView.register(CryptoCurrencyCell.self, forCellReuseIdentifier: CryptoCurrencyCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.bottom.equalTo(view.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
    }
}

// MARK: - TableView dataSource
extension CryptoCurrenciesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currencyCellsViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CryptoCurrencyCell.identifier,
            for: indexPath) as? CryptoCurrencyCell
        
        let cellViewModel = viewModel.currencyCellsViewModels[indexPath.row]
        cell?.setup(viewModel: cellViewModel)
        return cell ?? UITableViewCell()
    }
}

// MARK: - TableView delegate
extension CryptoCurrenciesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currency = viewModel.currencyCellsViewModels[indexPath.row].currency
        let detailsViewModel = CurrencyDetailsViewModel(currency: currency)
        let detailsVc = CurrencyDetailsViewController(viewModel: detailsViewModel)
        navigationController?.pushViewController(detailsVc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
