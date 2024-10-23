import UIKit



/*
 // classの基本
 // 様々なプログラムに用いられる汎用性の高い型
 class Automobile {
     //クラスに宣言さsれた変数や定数は「プロパティ」と呼ぶ
     var maker = "TOYOTA"
     var name = "ランドクルーザー"
     var doorCount = 5
     var fuelCapacity = 100 //リットル
     var displacement = 3000 // cc
     
     func horn() {
         print("プップー")
     }
     
     // イニシャライザ(=初期化子)
     // クラスをインスタンス化する際にプロパティの初期化を行う
     init(maker: String, name: String, doorCount: Int, fuelCapacity: Int, displacement: Int) {
         self.maker = maker
         self.name = name
         self.doorCount = doorCount
         self.fuelCapacity = fuelCapacity
         self.displacement = displacement
     }
     
 }

 // インスタンス化(=初期化)
 let myCar = Automobile(maker: "NISSAN", name: "フェアレディ", doorCount: 3, fuelCapacity: 70, displacement: 3700)

 print(myCar.maker)
 print(myCar.name)
 print(myCar.doorCount)
 print(myCar.fuelCapacity)
 print(myCar.displacement)
 //myCar.horn()
 */



/*
 // structの基本
 // classと同じ機能を持つ型
 // struct(構造体)→データ構造や値を表現する型
 struct Drink {
     var name: String
     var price: Int //円
     var amount: Int //ml
     
     //メソッド定義
     func outputData() {
         print(name)
         print(price)
         print(amount)
     }
 }
 let drink = Drink(name: "コーラ", price: 100, amount: 150)
 drink.outputData()
 */



/*
 // enumの基本
 // classやstructと共有する機能を持つ複数持つ型
 // class(クラス)→プログラムの設計図を表現する型
 // struct(構造体)→データ構造や値を表現する型
 // enum(列挙型)→予め定められた種別を表現する型
 enum TraficLightType {
     case blue
     case yellow
     case red
     
     // ストアドプロパティ→インスタンス化した際に値を保有する
     // コンピューティッドプロパティ→インスタンス化の有無に関わらず値を参照する
     var computedProperty: String {
         switch self {
         case .blue:
             return "青"
         case.yellow:
             return "黄"
         case .red:
             return "赤"
         }
     }
 }

 let signalType = TraficLightType.yellow

 // class→メソッド◎、プロパティ◎
 // struct→メソッド◎、プロパティ◎
 // enum→メソッド◎、プロパティ✕
 // enum→ストアドプロパティ✕、コンピューティッドプロパティ◎

 print(signalType.computedProperty)
 print(TraficLightType.blue.computedProperty)
 */



// 具体的な使用例
// 自動販売機のロジック作成
// 機能要件の整理
// ・日本円を入力できる
// ・対象の飲み物は「コーヒー」「水」「モンスター」とする
// ・入力された日本円と飲み物の価格を比較し、前者が後者の値を上回っている且つ対象の飲み物の在庫がある場合に購入可能フラグを返す
// ・飲み物が購入できた際に対象の飲み物の在庫を1減らす
// ・飲み物を購入した際に対象の飲み物の値段を入力された日本円から差し引く
class VirtualVendingMachine {
    // 入力された日本円
    var inputedYen = 0
    //飲み物の値段（円）
    var coffeePrice = 120
    var waterPrice = 100
    var monsterPrice = 210
    
    //飲み物の在庫
    var coffeeStock = 10
    var waterStock = 15
    var monsterStock = 5
    
    enum DrinkType {
        case coffee
        case water
        case monster
    }
    
    func buyDrink(type: DrinkType) -> Bool {
        var isBuyable = false
        switch type {
        case .coffee:
            isBuyable = coffeePrice < inputedYen && 0 < coffeeStock
            if isBuyable {
                inputedYen -= coffeePrice
            }
        case .water:
            isBuyable = waterPrice < inputedYen && 0 < waterStock
            if isBuyable {
                inputedYen -= waterPrice
            }
        case .monster:
            isBuyable = monsterPrice < inputedYen && 0 < monsterStock
            if isBuyable {
                inputedYen -= monsterPrice
            }
        }
        
        if isBuyable {
            reduceStock(type: type)
        }
        return isBuyable
    }
    
    func reduceStock(type: DrinkType) {
        switch type {
        case .coffee:
            coffeeStock -= 1
        case .water:
            waterStock -= 1
        case .monster:
            monsterStock -= 1
        }
    }
}

let vendingMachine = VirtualVendingMachine()
vendingMachine.inputedYen = 150

print("購入前の在庫は\(vendingMachine.coffeeStock)個です。")
let isBuyable = vendingMachine.buyDrink(type: .coffee)
print(isBuyable)
print("残高は\(vendingMachine.inputedYen)円です")
print("購入後の在庫は\(vendingMachine.coffeeStock)個です。")






