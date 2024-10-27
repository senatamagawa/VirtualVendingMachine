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
