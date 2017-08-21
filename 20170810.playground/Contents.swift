//: Playground - noun: a place where people can play

import UIKit

let fruits = ["Apple", "orange", "Banana"]

//대소문자 구분함
fruits.contains("Apple")
fruits.contains("apple")

fruits.contains { $0.caseInsensitiveCompare("apple") == .orderedSame }

var alphabet = ["M", "E", "S", "I"]

//축약 버전
alphabet.sort { $0 < $1 }
alphabet.sort(by: <)

//위에거 원래대로 하는거
alphabet.sort(by: { (lhs: String, rhs: String) -> Bool in
    return lhs < rhs
})

alphabet


let result = alphabet.map { $0.lowercased() }
print(result)
print(alphabet)

//let result = alphabet.map { $0.lowercased() } 축약되지 않은 버전
let result2 = alphabet.map ({ (str: String) -> String in
    return str.lowercased()
})

let words = ["A" : "Apple", "B" : "Banana", "C" : "City"]
let countOfWords = words.count

if !words.isEmpty {
    print("Not empty")
}

// Original
words.contains(where: { (data: (key : String, value : String)) -> Bool in
    return data.key == "A"
})

//축약
words.contains{ $0.key == "A" }
