//
//  HomeViewController.swift
//  MyColorMemoApp
//
//  Created by 玉川　世那 on 2024/10/06.
//

import Foundation
import UIKit // UIに関するクラスが格納されたモジュール
import RealmSwift

// HomeViewControllerにUIViewControllerを「クラス継承」する
class HomeViewController: UIViewController { 
    @IBOutlet weak var tableView: UITableView!
    
    var memoDataList: [MemoDataModel] = []
    let themeColorTypeKey = "themeColorTypeKey"
    
    //UIViewController UIKitにあらかじめ定義されている
    override func viewDidLoad() {
        // このクラスの画面が表示される際に呼び出されるメソッド
        // 画面の表示・非表示に応じて実行されるメソッドを「ライフサイクルメソッド」と呼ぶ
        print("HomeViewControllerが表示されました！")
        
        tableView.separatorColor = .lightGray
        tableView.separatorStyle = .singleLine
        if #available(iOS 15.0, *) {
            tableView.fillerRowHeight = 50
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        setNavigationBarButton()
        setLeftNavigationBarButton()
        let themeColorTypeInt = UserDefaults.standard.integer(forKey: themeColorTypeKey)
        let themeColorType = MyColorType(rawValue: themeColorTypeInt) ?? .default
        setThemeColor(type: themeColorType)
    }
    
    //保存したデータを表示
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setMemoData()
        tableView.reloadData()
    }
    
    //Realmで登録したデータを表示
    func setMemoData() {
        let realm = try! Realm()
        let result = realm.objects(MemoDataModel.self)
        memoDataList = Array(result)
    }
    
    @objc func tapAddButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let memoDetailViewController = storyboard.instantiateViewController(withIdentifier: "MemoDetailViewController") as! MemoDetailViewController
        navigationController?.pushViewController(memoDetailViewController, animated: true)
    }
    
    func setNavigationBarButton() {
        let buttonActionSelector: Selector = #selector(tapAddButton)
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: buttonActionSelector)
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func setLeftNavigationBarButton() {
        let buttonActionSelector: Selector = #selector(didTapColorSettingButton)
        let leftButtonImage = UIImage(named: "colorSettingIcon")
        let leftButton = UIBarButtonItem(image: leftButtonImage, style: .plain, target: self, action: buttonActionSelector)
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func didTapColorSettingButton() {
        let defaultAction = UIAlertAction(title: "デフォルト", style: .default, handler: { _ -> Void in
            self.setThemeColor(type: .default)
        })
        
        let orangeAction = UIAlertAction(title: "オレンジ", style: .default, handler: { _ -> Void in
            self.setThemeColor(type: .orange)
        })
        
        let redAction = UIAlertAction(title: "レッド", style: .default, handler: { _ -> Void in
            self.setThemeColor(type: .red)
        })
        
        let blueAction = UIAlertAction(title: "ブルー", style: .default, handler: { _ -> Void in
            self.setThemeColor(type: .blue)
        })
        
        let pinkAction = UIAlertAction(title: "ピンク", style: .default, handler: { _ -> Void in
            self.setThemeColor(type: .pink)
        })
        
        let greenAction = UIAlertAction(title: "グリーン", style: .default, handler: { _ -> Void in
            self.setThemeColor(type: .green)
        })
        
        let purpleAction = UIAlertAction(title: "パープル", style: .default, handler: { _ -> Void in
            self.setThemeColor(type: .purple)
        })
        
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        let alert = UIAlertController(title: "テーマカラーを選択", message: "", preferredStyle: .actionSheet)
        alert.addAction(defaultAction)
        alert.addAction(orangeAction)
        alert.addAction(redAction)
        alert.addAction(blueAction)
        alert.addAction(pinkAction)
        alert.addAction(greenAction)
        alert.addAction(purpleAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func setThemeColor(type: MyColorType) {
        let isDefault = type == .default
        let tintColor: UIColor = isDefault ? .black : .white
        navigationController?.navigationBar.tintColor = tintColor
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = type.color
        
        appearance.titleTextAttributes = [.foregroundColor: tintColor]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        saveThemeColor(type: type)
    }
    
    func saveThemeColor(type: MyColorType) {
        UserDefaults.standard.setValue(type.rawValue, forKey: themeColorTypeKey)
    }
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // numberOfRowsInSection リストの数を指定
        return memoDataList.count //配列内の要素数を適用
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cellForRowAt リストの中身を定義するためのメソッド
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        // indexPath.row→UITableViewに表示されるCellの(0から始まる)通し番号が順番に渡される
        let memoDataModel: MemoDataModel = memoDataList[indexPath.row]
        cell.textLabel?.text = memoDataModel.text
        cell.detailTextLabel?.text = "\(memoDataModel.recordDate)"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let targetMemo = memoDataList[indexPath.row]
        let realm = try! Realm()
        try! realm.write {
            realm.delete(targetMemo)
        }
        memoDataList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let memoDetailViewController = storyboard.instantiateViewController(identifier: "MemoDetailViewController") as! MemoDetailViewController
        
        let memoData = memoDataList[indexPath.row]
        memoDetailViewController.configure(memo: memoData)
        
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(memoDetailViewController, animated: true)
    }
}
