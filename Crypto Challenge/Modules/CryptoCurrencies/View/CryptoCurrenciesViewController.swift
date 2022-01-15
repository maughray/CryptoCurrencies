//
//  CryptoCurrienciesViewController.swift
//  Crypto Challenge
//
//  Created by Victor Morei on 14.01.2022.
//

import UIKit
import SnapKit

class CryptoCurrenciesViewController: UIViewController {
    
    private lazy var tableView = UITableView()
    private lazy var titleLabel = UILabel()
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
}

// MARK: - Setup UI
extension CryptoCurrenciesViewController {
    
    private func setupUI() {
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
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.bottom.equalTo(view.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
    }
}

extension CryptoCurrenciesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CryptoCurrencyCell.identifier, for: indexPath) as! CryptoCurrencyCell
        cell.setup()
        return cell
    }
}
