//
//  MemoDataModel.swift
//  MyColorMemoApp
//
//  Created by 玉川　世那 on 2024/10/06.
//

import Foundation
import RealmSwift

class MemoDataModel: Object {
    @Persisted var id: String = UUID().uuidString //データを一意に識別するための識別子
    @Persisted var text: String = ""
    @Persisted var recordDate: Date = Date()
}
