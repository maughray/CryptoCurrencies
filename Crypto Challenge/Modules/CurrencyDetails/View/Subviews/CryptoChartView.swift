//
//  CryptoChartView.swift
//  Crypto Challenge
//
//  Created by maughray on 1/16/22.
//

import UIKit
import SwiftCharts

class CryptoChartView: UIView {
    
    private var chartView: Chart!
    private var currency: Currency
    
    var chartSettings: ChartSettings {
        var chartSettings = ChartSettings()
        chartSettings.leading = 10
        chartSettings.top = 10
        chartSettings.trailing = 10
        chartSettings.bottom = 10
        chartSettings.labelsToAxisSpacingX = 5
        chartSettings.labelsToAxisSpacingY = 5
        chartSettings.axisTitleLabelsToLabelsSpacing = 4
        chartSettings.axisStrokeWidth = 0.2
        chartSettings.spacingBetweenAxesX = 8
        chartSettings.spacingBetweenAxesY = 8
        chartSettings.labelsSpacing = 0
        return chartSettings
    }
    
    var displayFormatter: DateFormatter {
        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "MMM dd"
        return displayFormatter
    }
    
    var readFormatter: DateFormatter {
        let readFormatter = DateFormatter()
        readFormatter.dateFormat = "dd.MM.yyyy"
        return readFormatter
    }
    
    func chartFrame(_ containerBounds: CGRect) -> CGRect {
        return CGRect(x: 0, y: 70, width: containerBounds.size.width, height: containerBounds.size.height - 70)
    }
    
    init(currency: Currency) {
        self.currency = currency
        super.init(frame: .zero)
        DispatchQueue.main.async {
            //self.createSubviews()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

// MAKR: - Create subviews
extension CryptoChartView {
    
//    private func createSubviews() {
//        let labelSettings = ChartLabelSettings(font: .systemFont(ofSize: 12))
//
//        func filler(_ date: Date) -> ChartAxisValueDate {
//            let filler = ChartAxisValueDate(date: date, formatter: displayFormatter)
//            filler.hidden = true
//            return filler
//        }
//
//        let (minimum, maximum) = currency.priceHistory.reduce((Double(Int.max), Double(Int.min))) {
//            (min($0.0, $1.price), max($0.1, $1.price))
//        }
//        let yValues = stride(from: minimum, through: maximum, by: 100).map { ChartAxisValueDouble(Double($0), labelSettings: labelSettings) }
//
//
//        let xGeneratorDate = ChartAxisValuesGeneratorDate(unit: .day, preferredDividers: 2, minSpace: 1, maxTextSize: 12)
//        let xLabelGeneratorDate = ChartAxisLabelsGeneratorDate(labelSettings: labelSettings, formatter: displayFormatter)
//        let firstDate = Date(timeIntervalSince1970: TimeInterval(currency.priceHistory.last?.timestamp ?? 0))
//        let lastDate = Date(timeIntervalSince1970: TimeInterval(currency.priceHistory.first?.timestamp ?? 0))
//        let xModel = ChartAxisModel(firstModelValue: firstDate.timeIntervalSince1970, lastModelValue: lastDate.timeIntervalSince1970, axisTitleLabels: [ChartAxisLabel(text: "Time", settings: labelSettings)], axisValuesGenerator: xGeneratorDate, labelsGenerator: xLabelGeneratorDate)
//
//        let yModel = ChartAxisModel(axisValues: yValues, axisTitleLabel: ChartAxisLabel(text: "Price", settings: labelSettings.defaultVertical()))
//        let chartFrame = chartFrame(bounds)
//
//        let coordsSpace = ChartCoordsSpaceRightBottomSingleAxis(chartSettings: chartSettings, chartFrame: chartFrame, xModel: xModel, yModel: yModel)
//        let (xAxisLayer, yAxisLayer, innerFrame) = (coordsSpace.xAxisLayer, coordsSpace.yAxisLayer, coordsSpace.chartInnerFrame)
//
//        let chartPoints = getChartPoints()
//        let chartPointsLineLayer = ChartCandleStickLayer<ChartPointCandleStick>(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, chartPoints: chartPoints, itemWidth: 5, strokeWidth: 0.6, increasingColor: UIColor.green, decreasingColor: UIColor.red)
//
//        let settings = ChartGuideLinesLayerSettings(linesColor: UIColor.black, linesWidth: 0.1)
//        let guidelinesLayer = ChartGuideLinesLayer(xAxisLayer: xAxisLayer, yAxisLayer: yAxisLayer, settings: settings)
//
//        let dividersSettings =  ChartDividersLayerSettings(linesColor: UIColor.black, linesWidth: 0.1, start: 3, end: 0)
//        let dividersLayer = ChartDividersLayer(xAxisLayer: xAxisLayer, yAxisLayer: yAxisLayer, settings: dividersSettings)
//
//        let chart = Chart(
//            frame: chartFrame,
//            innerFrame: innerFrame,
//            settings: chartSettings,
//            layers: [
//                xAxisLayer,
//                yAxisLayer,
//                guidelinesLayer,
//                dividersLayer,
//                chartPointsLineLayer
//            ]
//        )
//
//        addSubview(chart.view)
//        chartView = chart
//    }
//
//    private func getChartPoints() -> [ChartPointCandleStick] {
//        var result = [ChartPointCandleStick]()
//        for price in currency.priceHistory {
//            let date = Date(timeIntervalSince1970: TimeInterval(price.timestamp))
//            let high = price.price + Double.random(in: 0...1000)
//            let low = price.price - Double.random(in: 0...1000)
//            let open = price.price
//            let close = Double.random(in: low...high)
//            result.append(ChartPointCandleStick(
//                date: date,
//                formatter: displayFormatter,
//                high: Double(high),
//                low: Double(low),
//                open: Double(open),
//                close: Double(close))
//            )
//        }
//        return result
//    }
}
