//
//  GraphViewController.swift
//  MyDietDaryApp_Xcode15
//
//  Created by 玉川　世那 on 2024/10/11.
//

import UIKit
import Charts
import RealmSwift

class GraphViewController: UIViewController {
    @IBOutlet weak var graphView: LineChartView!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    
    var recordList: [WeightRecord] = []
    
    var datePicker: UIDatePicker {
        let datePicker: UIDatePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.timeZone = .current
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ja-JP")
        return datePicker
    }
    
    var dateFormatter: DateFormatter {
        let dateFormatt = DateFormatter()
        dateFormatt.dateStyle = .long
        dateFormatt.timeZone = .current
        dateFormatt.locale = Locale(identifier: "ja-JP")
        return dateFormatt
    }
    
    var toolBar: UIToolbar {
        let toolBarRect = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35)
        let toolBar = UIToolbar(frame: toolBarRect)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        toolBar.setItems([doneItem], animated: true)
        return toolBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setRecord()
        updateGraph()
        configureGraph()
        configureTextField()
    }
    
    func setRecord() {
        let realm = try! Realm()
        var result = Array(realm.objects(WeightRecord.self))
        result.sort(by: { $0.date < $1.date })
        recordList = result
        if let startDateText = startDateTextField.text,
           let endDateText = endDateTextField.text,
           let startDate = dateFormatter.date(from: startDateText),
           let endDate = dateFormatter.date(from: endDateText) {
            var filterRecord = Array(realm.objects(WeightRecord.self).filter("date BETWEEN { %@, %@ }", startDate, endDate))
            filterRecord.sort(by: { $0.date < $1.date })
            recordList = filterRecord
        }
    }
    
    func updateGraph() {
        var entry = [ChartDataEntry]()
        recordList.enumerated().forEach({ index, record in
            let data = ChartDataEntry(x: Double(index), y: record.weight)
            entry.append(data)
        })
        let dataSet = LineChartDataSet(entries: entry, label: "体重")
        graphView.data = LineChartData(dataSet: dataSet)
        graphView.data?.notifyDataChanged()
        graphView.notifyDataSetChanged()
    }
    
    func configureGraph() {
        graphView.xAxis.labelPosition = .bottom
        let titleFormatter = GraphDataTitleFormatter()
        let dateList = recordList.map({ $0.date })
        titleFormatter.dateList = dateList
        graphView.xAxis.valueFormatter = titleFormatter
    }
    
    func configureTextField() {
        let startDatePicker = datePicker
        let endDatePicker = datePicker
        let today = Date()
        let pastMonth = Calendar.current.date(byAdding: .month, value: -1, to: Calendar.current.startOfDay(for: today))!
        startDatePicker.date = pastMonth
        endDatePicker.date = today
        startDateTextField.inputView = startDatePicker
        endDateTextField.inputView = endDatePicker
        startDateTextField.text = dateFormatter.string(from: pastMonth)
        endDateTextField.text = dateFormatter.string(from: today)
        startDateTextField.inputAccessoryView = toolBar
        endDateTextField.inputAccessoryView = toolBar
        startDatePicker.addTarget(self, action: #selector(didChangeStartDate(picker:)), for: .valueChanged)
        endDatePicker.addTarget(self, action: #selector(didChangeEndDate(picker:)), for: .valueChanged)
    }
    
    @objc func didTapDone() {
        setRecord()
        updateGraph()
        view.endEditing(true)
    }
    
    @objc func didChangeStartDate(picker: UIDatePicker) {
        startDateTextField.text = dateFormatter.string(from: picker.date)
    }
    
    @objc func didChangeEndDate(picker: UIDatePicker) {
        endDateTextField.text = dateFormatter.string(from: picker.date)
    }
}
