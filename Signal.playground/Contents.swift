import UIKit

class Signal {
    enum SignalType {
        case blue
        case yellow
        case red
    }
    
    var inputSignal: String = ""
    
    var inputBlue = "青"
    var inputYellow = "黄"
    var inputRed = "赤"
    
    var walkBlue = "青"
    var walkRed = "赤"
    
    func signalSwitch(inputSignal: String) -> Bool {
        self.inputSignal = inputSignal
        var isSignal = false
        if inputSignal == inputBlue {
            isSignal = inputBlue == inputSignal
            print("車道の信号は\(signal.inputSignal)")
            print("歩行者信号は\(walkRed)")
        } else if inputSignal == inputYellow {
            isSignal = inputYellow == inputSignal
            print("車道の信号は\(signal.inputSignal)")
            print("歩行者信号は\(walkRed)")
        } else if inputSignal == inputRed {
            isSignal = inputRed == inputSignal
            print("車道の信号は\(signal.inputSignal)")
            print("歩行者信号は\(walkBlue)")
        } else {
            print("信号機故障中")
        }
        
        return isSignal
    }
}

let signal = Signal()
let isSuccessSignal = signal.signalSwitch(inputSignal: "青")


