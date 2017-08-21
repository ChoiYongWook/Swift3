import UIKit

//정수 자료형
var num = 123

num  = 10
num = 0b1010
num = 0o12
num = 0xA

Int.max
Int.min

let isTrue = true
let isFalse = false
let notBolean: Bool = isTrue

//String Literals
//NS~ : NS접두어가 붙은것은 class로 생각하면 된다.
//objective-C에서 많이 사용하지만 스위프트에서는 그냥 String으로 사용
let str: String = "string"
let nsstr: NSString = "nsstring"
let char: Character = "c"
let noChar = "c"

print(noChar)
debugPrint(noChar)
dump(noChar)

//형변환
let a = 123
var b: Int64 = Int64(a)
var c: Int64 = 0