import UIKit

/*
 //var:変数を宣言 str: 変数名 = 値　→　値を代入する
 var str = "Hello, playground"
  //メソッドとは　→ 何かの処理を実行するためのもの
 print(str)
 */



/*
 //変数と定数
 var variable = "variable" //var:変数
 let constant = "constant" //let:定数

 //Lower camel case 変数定数で使用
 var userName = "userName"
 //Upper camel case　クラス名の指定で使用
 var UserName = "UserName"

 //値の再代入 ※定数は再代入できない
 print(variable)
 variable = "variable2"
 print(variable)
 */



/*
 //基本的な型の理解
 //基本的な型について

  let string: String = "string"
  let int: Int = 0
  let double: Double = 0.0
  let bool: Bool = true //true or false

  print(string)
  print(int)
  print(double)
  print(bool)
 */


/*
 //型推論  上記の型の書き方を省略した書き方
 let string2 = "string2"
 print(string2)

 var double2 = 0.0
 double2 = 0.5
 */



/*
 //真理値を示すBool型について
 let hoge = true
 let fuga = false
 print(hoge)
 print(fuga)

 //論理演算
 //否定
 let isMyAccount = true
 let isNotAccount = !isMyAccount
 print(isMyAccount)
 print(isNotAccount)

 //論理積 AND
 /*
  let one = false && false
  let two = false && true
  let three = true && false
  let four = true && true
  */

 //論理和 OR
 let one = false || false
 let two = false || true
 let three = true || false
 let four = true || true
 print(one)
 print(two)
 print(three)
 print(four)
 */



/*
 // 数値計算
 // 四則演算と剰余演算
 // 四則演算→足し算、引き算、掛け算、割り算
 let plus = 1 + 1
 let minus = 1 - 1
 let multiply = 1 * 1
 let divide = 1 / 1

 // 剰余演算→ある値を別の値を割った時の余りの値を算出する演算
 let surplus = 10 % 3 //余りが表示される

 let int = 1
 let double = 0.5
 let result = Double(int) + double
 print(result)
 */



/*
 // 数値の比較演算 bool型で受け取る演算子
 let a = 10
 let b = 10
 let result = a == b

 // 比較演算子
 // == → 右辺と左辺が一致する
 // != → 右辺と左辺が一致しない
 // >  → 右辺が左辺よりも小さい
 // >= → 右辺が左辺以下
 // <  → 右辺が左辺よりも大きい
 // <= → 右辺が左辺以上
 let c = 100 != 100

 let d = 100 > 100
 let e = 100 >= 100

 let f = 100 < 100
 let g = 100 <= 100
 let ha = 1.5
 let hb = 1.5
 let h = ha == hb
 let i = 1.5 != 1.5
 let j = ha < hb
 let k = 1.5 <= 1.5

 print(h)
 print(i)
 print(j)
 print(k)

 // 演算子≒オペレーター
 */



/*
 // 文字列の比較演算
 // ==→右辺と左辺が一致する
 // !=→右辺と左辺が一致しない

 let fruits1 = "りんご"
 let fruits2 = "ばなな"
 let wqualString = fruits1 != fruits2

 let one = 1
 let two = "2"
 let twoInt = Int(two)
 let oneString = String(one)
 let equalInt = one == twoInt
 let equalString2 = oneString == two

 let contents = "フルーツの中身は" + fruits1 + "と" + fruits2 + "です。"
 print(contents)
 */



/*
 // 配列を表現するArray型 順序を持った値の集合体
 var stringArray = ["a", "b", "c"] //値の型 エレメント 0start
 let a = stringArray[0]
 stringArray.append("d") //appendメソッド:配列の最後に値を追加
 stringArray.remove(at: 0) //removeメソッド: 渡された要素番号を削除
 let mappedStringArray = stringArray.map({ $0 + "です"}) //mapメソッド: 各配列処理の任意の処理を行う　順番に表示される
 print(mappedStringArray)

 var intArray = [1,2,3]
 let mappedIntArray = intArray.map({$0 + 1})
 print(mappedIntArray)

 let isContain = mappedIntArray.contains(2) //containメソッド:渡された値と同一の要素が配列ないに存在するかどうかをbool型で返す機能
 print(isContain)
 */



/*
 // Optional型 値のあるなしの状態をもつ型
 let int: Int? = nil //?にすることでOptional型にできる　注意：そのまま四則演算子を行うことができない
 let intNil: Int? = nil //値がない状態の場合に「nil」を代入する

 let one = int ?? 10 //intの値がnilでなければ上記の値で代入される
 let two = intNil ?? 20 //??:デフォルト値 optional型の値がnilだった場合に代わりに代入する値
 let result = one + two
 print(result)
 */



/*
 //if文
 let isTrue = true
 if isTrue {
 }

 let number = 3
 if number == 1 {
     print("numberは 1 です")
 } else if number == 2 {
     print("numberは 2 です")
 } else {
     print("numberは 1 と 2　以外です")
 }

 //オプショナルバインディング nilだった場合の対処
 let optionaiInt: Int? = 1
 if let int = optionaiInt {
     print(int)
 }
 */



/*
 //switch文 各パターンごとに実行する処理
 let numberText = "for"

 switch numberText {
 case "one":
     print("numberTextは「one」です")
 case "two":
     print("numberTextは「two」です")
 default:
     print("numberはone,two以外です")
 }

 let number = 1

 switch number {
 case 1:
     print("numberは「1」です。")
 case 2:
     print("numberは「2」です。")
 case 3:
     print("numberは「3」です。")
 default:
     print("numberは「1」「2」「3」以外です。")
 }

 // 範囲を表すRange型
 let range = 1..<5 //「...」 range型を指定　「<」 最後の型を指定しない（この場合は5は含まれない）

 let primarySchool = 6...12
 let middleSchool = 13...15
 let highSchool = 16...18
 let unibersitySchool = 19...22

 let age = 21

 switch age {
 case primarySchool:
     print("小学生です")
 case middleSchool:
     print("中学生です。")
 case highSchool:
     print("高校生です。")
 case unibersitySchool:
     print("大学生です。")
 default:
     print("学生は不明です。")
 }
 */



// 繰り返しの処理
// for-in文 順番にアクセスし処理を行う
let array = [1,2,3]
for element in array {
    print(element)
}

let range = 1...15

for i in range {
    print(i)
}
// while文 指定処理が成り立つまで実行される処理
var number = 1
while number < 11 {
    print(number)
    number += 1
}

// 1から10までの数値の内、偶数の場合にのみログを出力する
var countUpNumber = 1
while countUpNumber <= 10 {
    let isEven: Bool = countUpNumber % 2 == 0
    if isEven {
        print("\(countUpNumber)は偶数です。")
    }
    countUpNumber += 1
}
