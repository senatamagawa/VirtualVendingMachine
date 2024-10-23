import UIKit



/*
 // protocolの基本
 // 複数クラス間で共有のインターフェースや機能を持たせる約束事
 protocol Animal {
     var subjectName: String { get }
     
     func say()
 }

 protocol Pets {
     var ownerName: String{ get }
 }

 class Dog: Animal, Pets {
     var subjectName = "イヌ科"
     var ownerName = "太郎"
     
     func say() {
         print("ワン")
     }
 }

 class Cat: Animal, Pets {
     var subjectName = "ネコ科"
     var ownerName = "次郎"
     
     func say() {
         print("ニャー")
     }
 }

 //classにprotocolを準拠する
 let dog = Dog()
 dog.say()

 let cat = Cat()
 cat.say()
 */



/*
 // Delegateの基本  委任や委託といった意味を持つ
 // あるクラスの特定の処理完了時に他のクラスに別の処理を実行させる
 protocol BathDelegate {
     func notification(currentStorage: Int)
 }

 class Controller: BathDelegate {
     let bath = Bath()
     var waterStorageLimit = 0 //リットル
     
     func registerDelegate() {
         bath.delegate = self
     }
     
     func startInject() {
         bath.injectWater()
     }
     
     func notification(currentStorage: Int) {
         let isStorageLimit = currentStorage >= waterStorageLimit
         if isStorageLimit {
             bath.shouldStopInjection = true
             print("注水を終了します。")
         }
     }
 }

 class Bath {
     var currentStorage = 0 //リットル
     var shouldStopInjection = false
     var delegate: BathDelegate?
     
     func injectWater() {
         while !shouldStopInjection {
             currentStorage += 50
             print("現在の水量は\(currentStorage)リットルです。")
             delegate?.notification(currentStorage: currentStorage)
         }
     }
 }

 let controller = Controller()
 controller.waterStorageLimit = 200
 controller.registerDelegate()
 controller.startInject()
 */



// Extension
// クラスや型の拡張機能を持たせる構文
class User {
    var name = "Undefined"
}

//拡張したクラス内と同じアクションができる
extension User {
    func printUserName() {
        print(name)
    }
}

let user = User()

// extensionを活用する恩恵
// 1. プログラムを書く際にswiftファイルを分割することができる
// →1ファイル辺りのコード凌は多くし過ぎない方がよい
// 2. 処理ブロックの関心事を分割する
protocol TimelineDelegate {
    func post(text: String)
}

extension User: TimelineDelegate {
    func post(text: String) {
        print("Timelineには\(text)が投稿されました。")
    }
}

let a = "aa"
print(user.post(text: a))

extension String {
    var logText: String {
        return "この文字列は\(self)です。"
    }
}

let text = "テキスト"
print(text.logText)


extension Int {
    var increasedValue: Int {
        return self + 1
    }
}

let one = 1
print(one.increasedValue)



