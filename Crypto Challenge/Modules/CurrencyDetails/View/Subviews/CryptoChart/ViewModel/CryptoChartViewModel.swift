//
//  CryptoChartViewModel.swift
//  Crypto Challenge
//
//  Created by Victor Morei on 19.01.2022.
//

import Foundation
import Resolver
import PredicateFlow

class CryptoChartViewModel {
    
    @Injected var databaseService: DatabaseService
    private(set) var chartPoints = [CryptoChartPoint]()
    private(set) var minPriceAxisValue: Double = Double.greatestFiniteMagnitude
    
    var isEnoughChartData: Bool {
        return chartPoints.count > 1
    }
    
    init(currency: Currency) {
        loadChartPoints(currencyCode: currency.code)
    }
    
    private func loadChartPoints(currencyCode: String) {
        let timestamp = Int64(Date().timeIntervalSince1970)
        let initTimestamp = Int64(Date().timeIntervalSince1970) - Constants.Charts.interval
        let initDbTimestamp = initTimestamp - 30 /// Load older prices, in case if DB does not contain info about last second in chart
        var values = [Int64: Double]() /// Add prices to dictionary for instant access
        
        loadPrices(currencyCode: currencyCode, timestamp: initDbTimestamp).forEach {
            values[$0.timestamp] = $0.price
            
            if $0.price < minPriceAxisValue {
                minPriceAxisValue = $0.price
            }
        }
        minPriceAxisValue -= (minPriceAxisValue / 10000)
        
        /// FInd last value in chart
        var lastPrice: Double = 0
        for i in stride(from: initTimestamp - 1, through: initDbTimestamp, by: -1) {
            if let price = values[i] {
                lastPrice = price
            }
        }
        
        /// Create chart points
        for i in initTimestamp...timestamp {
            let y = values[i] ?? lastPrice
            let x = i - initTimestamp
            lastPrice = y
            chartPoints.append(CryptoChartPoint(x: Double(x), y: y))
        }
    }
    
    private func loadPrices(currencyCode: String, timestamp: Int64) -> [CurrencyPriceEntity] {
        let predicate = PredicateBuilder(CurrencyPriceEntitySchema.currencyCode.is(currencyCode))
            .and(CurrencyPriceEntitySchema.timestamp.isGreater(thanOrEqual: timestamp))
            .build()
        
        return databaseService.fetch(CurrencyPriceEntity.self, filter: predicate)
    }
}
