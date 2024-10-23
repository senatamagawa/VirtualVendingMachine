//
//  GraphDataTitleFormatter.swift
//  MyDietDaryApp_Xcode15
//
//  Created by 玉川　世那 on 2024/10/15.
//

import Foundation
import Charts

class GraphDataTitleFormatter: AxisValueFormatter {
    var dateList: [Date] = []
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let index = Int(value)
        guard dateList.count > index else { return "" }
        let targetDate = dateList[index]
        let formatter = DateFormatter()
        let dateFormatString = "MM/dd"
        formatter.dateFormat = dateFormatString
        return formatter.string(from: targetDate)
    }
}
