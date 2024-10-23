//
//  CalenderViewController.swift
//  MyDietDaryApp_Xcode15
//
//  Created by 玉川　世那 on 2024/10/11.
//

import UIKit
import FSCalendar
import RealmSwift

class CalenderViewController: UIViewController {
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var addButton: UIButton!
    
    var recordList: [WeightRecord] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCalendar()
        configureButton()
        calendarView.dataSource = self
        calendarView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getRecord()
        calendarView.reloadData()
    }

    @IBAction func tappedAddButton(_ sender: UIButton) {
        transitionToEditorView()
    }
    
    func configureCalendar() {
        // ヘッダーの日付フォーマットを変更
        calendarView.appearance.headerDateFormat = "yyyy年MM月dd日"
        // 曜日と今日の色を指定
        calendarView.appearance.todayColor = .orange
        calendarView.appearance.headerTitleColor = .orange
        calendarView.appearance.weekdayTextColor = .black
        // 曜日表示内容を変更
        calendarView.calendarWeekdayView.weekdayLabels[0].text = "日"
        calendarView.calendarWeekdayView.weekdayLabels[1].text = "月"
        calendarView.calendarWeekdayView.weekdayLabels[2].text = "火"
        calendarView.calendarWeekdayView.weekdayLabels[3].text = "水"
        calendarView.calendarWeekdayView.weekdayLabels[4].text = "木"
        calendarView.calendarWeekdayView.weekdayLabels[5].text = "金"
        calendarView.calendarWeekdayView.weekdayLabels[6].text = "土"
        // 土日の色を変更
        calendarView.calendarWeekdayView.weekdayLabels[0].textColor = .red
        calendarView.calendarWeekdayView.weekdayLabels[6].textColor = .blue
    }
    
    func configureButton() {
        addButton.layer.cornerRadius = addButton.bounds.width / 2
    }
    
    func transitionToEditorView(with record: WeightRecord? = nil) {
        let storyboard = UIStoryboard(name: "EditorViewController", bundle: nil)
        guard let editorViewController = storyboard.instantiateInitialViewController() as? EditorViewController else { return }
        if let record = record {
            editorViewController.record = record
        }
        editorViewController.delegate = self
        present(editorViewController, animated: true)
    }
    
    func getRecord() {
        let realm = try! Realm()
        recordList = Array(realm.objects(WeightRecord.self))
    }
}

extension CalenderViewController: FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let dateList = recordList.map({ $0.date.zeroclock })
        let isEqualDate = dateList.contains(date.zeroclock)
        return isEqualDate ? 1 : 0
    }
}

extension CalenderViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        calendar.deselect(date)
        guard let record = recordList.first(where: { $0.date.zeroclock == date.zeroclock}) else { return }
        transitionToEditorView(with: record)
    }
}

extension CalenderViewController: EditorViewControllerDelegate {
    func recordUpdate() {
        getRecord()
        calendarView.reloadData()
    }
}
