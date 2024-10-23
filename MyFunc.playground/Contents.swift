import UIKit



/*
 // 関数の基本
 // 特定の処理を一つの塊にしたもの
 // 入力値→引数
 // 出力値→戻り地
 // 関数→メソッドとも呼ばれる

 func sayHello() {
     print("Hello!")
 }
 sayHello()

 // 「引数」あり
 func say(text: String) {
     print(text)
 }
 say(text: "Hello!2")

 // 「引数」と「戻り値」あり
 func double(number: Int) -> Int { //戻り値　関数の後に　-> を指定する
     let result = number * 2
     return result // return を返すことで戻り値を返せる
 }
 let originNumber = 10
 let doubleNumber = double(number: originNumber)
 print(doubleNumber)

 // 複数の「引数」を持つ関数 　引数はいくつでも指定可能
 func sum(first: Int, second: Int) -> Int {
     return first + second
 }
 let first = 6
 let second = 10
 let sumNumber = sum(first: first, second: second)
 print(sumNumber)
 */



/*
 // 関数の応用知識
 // 外部引数名(関数を呼び出す引数名)と内部引数名(関数内部で使用する引数名)
 func sum(_ first: Int, _ second:Int) -> Int { //外部引数名を省略する際は「 _ 」を記入
     return first + second
 }
 let first = 5
 let second = 10
 let sumNumber = sum(first, second) //外部引数名
 print(sumNumber)

 // コードの挙動を変えずに見やすくすること→リファクタリング

 // 引数のデフォルト値
 func say(text: String = "Hello!") {
     print(text)
 }
 say(text: "GoodMorning!")
 say()
 */



// 関数の応用知識
// 引数と戻り値に配列を持つ関数
/*
 func getEven(from array: [Int]) -> [Int] {
     var result: [Int] = []
     for element in array {
         let isEven = element % 2 == 0
         if isEven {
             result.append(element)
         }
     }
     return result
 }
 let array = [1, 2, 3, 4, 5]
 let result = getEven(from: array)
 */


/*
 // guard文  関数内で特定の条件を満たさなかった場合にその時点で関数を実行せず終了する構文
 func sum(first: Int?, second: Int?) -> Int {
     guard first != nil, second != nil else {
         print("firstからsecondがnilです。")
         return 0
     }
     return first! + second!
 }
 let result = sum(first: nil, second: 2)
 print(result)
 */


/*
 // オプショナルバインディング
 // Optional型を非Optional型へ変換したい場合に用いる構文
 func sum(one: Int?, two: Int?) -> Int {
     guard let one = one, let two = two else { //guardの後にlet(定数)を指定することでオプショナルバインディング処理をかける
         print("oneかtwoがnilです。")
         return 0
     }
     return one + two //オプショナルバインディング処理の場合、戻り値は「!」を外す
 }
 let result = sum(one: 1, two: 2)
 print(result)
 */

