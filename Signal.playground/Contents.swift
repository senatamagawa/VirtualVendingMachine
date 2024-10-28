import UIKit


// Global scope
enum SignalType {
    case blue
    case yellow
    case red

    var price: Int {
        switch self {
        case .blue: return 1
        case .yellow: return 2
        case .red: return 3
        }
    }
}

// Global scope
struct SignalModel {
    var type: SignalType
}

// Global scope
protocol StopSignalValidatable {}
extension StopSignalValidatable {
    func validateSignal(with drink: SignalModel,
                              inputSignal: Int) -> Bool {
        guard drink.type.price == inputSignal else {
            print("信号機故障中")
            return false
        }
        return drink.type.price < inputSignal
    }
}

class VirtualVendingMachine: StopSignalValidatable {
    private var inputedSignal: Int = 0
    private var blue = SignalModel(type: .blue)
    private var yellow = SignalModel(type: .yellow)
    private var red = SignalModel(type: .red)
    
    private var otherYen: Int = 0

    func buyDrink(type: SignalType, inputedSignal: Int) -> Bool {
        switch type {
        case .blue:
            let isSignal = validateSignal(with: blue, inputSignal: inputedSignal)
            if inputedSignal == 1 {
                print("青信号")
            }
            return isSignal
        case .yellow:
            let isSignal = validateSignal(with: yellow, inputSignal: inputedSignal)
            if inputedSignal == 2 {
                print("黄信号")
            }
            return isSignal
        case .red:
            let isSignal = validateSignal(with: red, inputSignal: inputedSignal)
            if inputedSignal == 3 {
                print("赤信号")
            }
            return isSignal
        }
    }

}

let virtualVendingMachine = VirtualVendingMachine()
let isSuccessToBuy = virtualVendingMachine.buyDrink(type: .blue, inputedSignal: 1)



