//: Playground - noun: a place where people can play

import UIKit

var optionalString: String? = "Hello, Optional!!"
print(optionalString!)

//강제추출 (ForcedUnwrapping)
var optionalString2: String? = nil
if optionalString2 != nil {
    print(optionalString2!)
}

//Optional Binding
var optionalStr3: String? = "Hello, Optional"

if let str = optionalStr3 {
    print(str)
}

//IUO : 명시적 추출 (가능하다면 안쓰는게 좋음)
var iuoStr: String! = "Hello"
print("iuoStr : " + iuoStr)

print("iuoStr 강제추출 : " + iuoStr!)

var optionalStr4: String? = "Hello, Optional!"
let result = optionalStr4 ?? "???"

print(result)

let str = "not a number"
let result2 = Int(str)?.description

let f: (() -> String?)? = nil
f?()
