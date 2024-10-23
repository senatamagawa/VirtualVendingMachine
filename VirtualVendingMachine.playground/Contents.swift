import UIKit

class VirtualVendingMachine {
    enum DrinkType {
        case coffee
        case water
        case monster
    }
    
    var inputedYen: Int = 0
    
    var coffeePrice: Int = 120
    var waterPrice: Int = 100
    var monsterPrice: Int = 210
    
    var coffeeStock: Int = 0
    var waterStock: Int = 15
    var monsterStock: Int = 1
    
    var otherYen: Int = 0
    
    func buyDrink(type: DrinkType, inputedYen: Int) -> Bool {
        self.inputedYen = inputedYen
        var isBuyable = false
        print("\(virtualVendingMachine.inputedYen)円投入")
        
        switch type {
            
        case .coffee:
            print("コーヒーを選択")
            isBuyable = coffeePrice <= inputedYen && 0 < coffeeStock
            if isBuyable {
                virtualVendingMachine.inputedYen -= coffeePrice
                coffeeStock -= 1
                print("残り在庫: \(virtualVendingMachine.coffeeStock)個")
                print("お釣り: \(virtualVendingMachine.inputedYen)円")
            } else if virtualVendingMachine.coffeeStock <= 0 {
                print("コーヒーの在庫がありません")
            } else {
                print("金額が足りません")
                coffeePrice -= virtualVendingMachine.inputedYen
                print("不足金額: \(coffeePrice)円")
            }
            
        case .water:
            print("水を選択")
            isBuyable = waterPrice <= inputedYen && 0 < waterStock
            if isBuyable {
                virtualVendingMachine.inputedYen -= waterPrice
                waterStock -= 1
                print("\(waterPrice)円")
                print("残り在庫: \(virtualVendingMachine.waterStock)個")
                print("お釣り: \(virtualVendingMachine.inputedYen)円")
            } else if virtualVendingMachine.waterStock <= 0 {
                print("水の在庫がありません")
            } else {
                print("金額が足りません")
                waterPrice -= virtualVendingMachine.inputedYen
                print("不足金額: \(waterPrice)円")
            }
            
        case .monster:
            print("モンスターを選択")
            isBuyable = monsterPrice <= inputedYen && 0 < monsterStock
            if isBuyable {
                virtualVendingMachine.inputedYen -= monsterPrice
                monsterStock -= 1
                print("残り在庫: \(virtualVendingMachine.monsterStock)個")
                print("お釣り: \(virtualVendingMachine.inputedYen)円")
            } else if virtualVendingMachine.monsterStock <= 0 {
                print("モンスターの在庫がありません")
            } else {
                print("金額が足りません")
                monsterPrice -= virtualVendingMachine.inputedYen
                print("不足金額: \(monsterPrice)円")
            }
            
        }
        
        return isBuyable
    }
    
    func other(type: DrinkType, otherYen: Int) {
        switch type {
        case .coffee:
            print("日本円以外のため返却")
        case .water:
            print("日本円以外のため返却")
        case .monster:
            print("日本円以外のため返却")
        }
    }
    
    
}

let virtualVendingMachine = VirtualVendingMachine()
let isSuccessToBuy = virtualVendingMachine.buyDrink(type: .monster, inputedYen: 250)
//let Others: () = virtualVendingMachine.other(type: .coffee, otherYen: 100)
