//
//  CryptoCurrienciesViewController.swift
//  Crypto Challenge
//
//  Created by Victor Morei on 14.01.2022.
//

import UIKit

class CryptoCurrenciesViewController: UIViewController {
    
    @IBOutlet weak var cryptoCurrenciesTableView: UITableView!
    
}

extension CryptoCurrenciesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cryptoCurrenciesTableView.dequeueReusableCell(
            withIdentifier: CryptoCurrencyCell.identifier,
            for: indexPath)
        
        
        return cell
    }
}
