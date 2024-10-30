import UIKit


// Global scope
enum SignalType {
    case blue
    case yellow
    case red

    var signalsType: String {
        switch self {
        case .blue: return "青"
        case .yellow: return "黄"
        case .red: return "赤"
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
    func validateSignal(with signals: SignalModel,
                              inputSignal: String) -> Bool {
        guard signals.type.signalsType == inputSignal else {
            print("信号機故障中")
            return false
        }
        return signals.type.signalsType < inputSignal
    }
}

class Signal: StopSignalValidatable {
    private var inputedSignal: String = ""
    private var blue = SignalModel(type: .blue)
    private var yellow = SignalModel(type: .yellow)
    private var red = SignalModel(type: .red)

    func goSignal(type: SignalType, inputedSignal: String) {
        switch type {
        case .blue:
            let isSignal = validateSignal(with: blue, inputSignal: inputedSignal)
            if inputedSignal == "青" {
                print("現在、\(blue.type.signalsType)信号")
                print("次は \(yellow.type.signalsType)信号")
            }
        case .yellow:
            let isSignal = validateSignal(with: yellow, inputSignal: inputedSignal)
            if inputedSignal == "黄" {
                print("現在、\(yellow.type.signalsType)信号")
                print("次は \(red.type.signalsType)信号")
            }
        case .red:
            let isSignal = validateSignal(with: red, inputSignal: inputedSignal)
            if inputedSignal == "赤" {
                print("現在、\(red.type.signalsType)信号")
                print("次は \(blue.type.signalsType)信号")
            }
        }
    }

}

let signal = Signal()
let signalColor: () = signal.goSignal(type: .red, inputedSignal: "赤")



