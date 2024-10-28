import UIKit

// Global scope
enum DrinkType {
    case coffee
    case water
    case monster

    var price: Int {
        switch self {
        case .coffee: return 120
        case .water: return 100
        case .monster: return 210
        }
    }
}

// Global scope
struct DrinkModel {
    var type: DrinkType
    var stock: Int
}

// Global scope
protocol BuyDrinkValidatable {}
extension BuyDrinkValidatable {
    func validateDrinkBuyable(with drink: DrinkModel,
                              inputYen: Int) -> Bool {
        guard drink.stock > .zero else {
            print("在庫が不足しています")
            return false
        }
        return drink.type.price < inputYen
    }
}

class VirtualVendingMachine: BuyDrinkValidatable {
    private var inputedYen: Int = 0
    private var coffee = DrinkModel(type: .coffee, stock: 10)
    private var water = DrinkModel(type: .water, stock: 15)
    private var monster = DrinkModel(type: .monster, stock: 1)
    
    private var otherYen: Int = 0

    func buyDrink(type: DrinkType, inputedYen: Int) -> Bool {
        print("投入金額: \(inputedYen)円")
        switch type {
        case .coffee:
            let isBuyable = validateDrinkBuyable(with: coffee, inputYen: inputedYen)
            if isBuyable {
                print("残り在庫: \(coffee.stock - 1)個")
                print("お釣: \(inputedYen - coffee.type.price)円")
            } else if inputedYen < coffee.type.price {
                print("投入金額が\(coffee.type.price - inputedYen)円足りません")
            }
            return isBuyable
        case .water:
            let isBuyable = validateDrinkBuyable(with: water, inputYen: inputedYen)
            if isBuyable {
                print("残り在庫: \(water.stock - 1)個")
                print("お釣: \(inputedYen - water.type.price)円")
            } else if inputedYen < water.type.price {
                print("投入金額が\(water.type.price - inputedYen)円足りません")
            }
            return isBuyable
        case .monster:
            let isBuyable = validateDrinkBuyable(with: monster, inputYen: inputedYen)
            if isBuyable {
                print("残り在庫: \(monster.stock - 1)個")
                print("お釣: \(inputedYen - monster.type.price)円")
            } else if inputedYen < monster.type.price {
                print("投入金額が\(monster.type.price - inputedYen)円足りません")
            }
            return isBuyable
        }
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
let isSuccessToBuy = virtualVendingMachine.buyDrink(type: .monster, inputedYen: 200)
//let Others: () = virtualVendingMachine.other(type: .coffee, otherYen: 100)

/*
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

 */

