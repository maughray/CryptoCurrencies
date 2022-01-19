//
//  CryptoChartView.swift
//  Crypto Challenge
//
//  Created by maughray on 1/16/22.
//

import UIKit
import Charts

class CryptoChartView: UIView {
    
    private let chartView = LineChartView()
    private var viewModel: CryptoChartViewModel
    
    init(viewModel: CryptoChartViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

// MAKR: - Create subviews
extension CryptoChartView {
    
    private func createSubviews() {
        if viewModel.isEnoughChartData {
            createChartSubview()
        } else {
            createMissingDataLabel()
        }
    }
    
    private func createMissingDataLabel() {
        let label = UILabel()
        label.text = "Not enough data"
        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
    }
    
    private func createChartSubview() {
        addSubview(chartView)
        chartView.snp.makeConstraints { make in
            make.size.equalTo(self).offset(-15)
        }
        configureChart()
        setChartValues()
    }
}

// MARK: - Chart configuration
extension CryptoChartView {
    
    func configureChart() {
        chartView.leftAxis.axisMinimum = viewModel.minPriceAxisValue
        chartView.legend.enabled = false
        chartView.rightAxis.enabled = false
        chartView.leftAxis.labelTextColor = .gray
        
        let xAxis = chartView.xAxis
        xAxis.labelTextColor = .gray
        xAxis.labelPosition = .bottom
        xAxis.axisMinimum = 0
        xAxis.labelRotationAngle = -90
        xAxis.granularity = 1
    }
    
    func setChartValues() {
        let values = viewModel.chartPoints.map { ChartDataEntry(x: $0.x, y: $0.y) }
        let set = LineChartDataSet(entries: values)
        
        set.drawCirclesEnabled = false
        set.drawCircleHoleEnabled = false
        set.drawFilledEnabled = false
        set.mode = .linear
        set.drawValuesEnabled = false
        set.lineWidth = 2
        set.setColor(.green)
        
        let gradientColors = [UIColor.clear.cgColor, UIColor.green.cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        
        set.fillAlpha = 0.5
        set.fill = Fill(linearGradient: gradient, angle: 90)
        set.drawFilledEnabled = true
        
        let data = LineChartData(dataSet: set)
        
        chartView.data = data
    }
}

