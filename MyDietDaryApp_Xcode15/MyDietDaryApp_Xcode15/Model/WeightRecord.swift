//
//  WeightRecord.swift
//  MyDietDaryApp_Xcode15
//
//  Created by 玉川　世那 on 2024/10/12.
//

import Foundation
import RealmSwift

class WeightRecord: Object {
    override static func primaryKey() -> String {
        return "id"
    }
    
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var date: Date = Date()
    @objc dynamic var weight: Double = 0
}
