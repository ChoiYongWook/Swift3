//: Playground - noun: a place where people can play

import UIKit

let str = "string"
//Char
let firstCh = str[str.startIndex]

//String
let converted = String(firstCh)

//endIndex에 접근
let lastCh = str.index(before: str.endIndex)

var index0 = str.startIndex
var index1 = str.index(after: index0)
var index2 = str.index(after: index1)
index2 = str.index(str.startIndex, offsetBy: 2)

index1 = str.index(before: index2)
index0 = str.index(index2, offsetBy: -2)

let date = "20170805"
var year = date.substring(to: date.index(date.startIndex, offsetBy:4))
var month = date[date.index(date.startIndex, offsetBy: 4) ..< date.index(date.startIndex, offsetBy: 6)]

//var month = date.substring(to: date.index(4, offsetBy:6))
//var month = date.substring(to: date.)

var substr = str.substring(to: str.index(str.startIndex, offsetBy: 5))
substr

substr = str.substring(from: str.index(str.startIndex, offsetBy: 5))
substr

substr = str.substring(with: str.startIndex ..< str.index(str.startIndex, offsetBy: 5))
substr

substr = str[str.startIndex ..< str.index(str.startIndex, offsetBy: 5)]


//var str = "Hello, Swift!!"
//var result = str.

//let url = URL(string: "http://www.apple.com")
//
//if let html = try? String(contentsOf: url!) {
//    print(html)
//    
//    let list = html.components(separatedBy: "\n")
//    list.count
//}

let csv = "name, 123, email@url.com"
let list = csv.components(separatedBy: ",")
print(list[0])

let emailRegex = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
let email = "user@example.com"

let options = String.CompareOptions.regularExpression
email.range(of: emailRegex, options: options)
