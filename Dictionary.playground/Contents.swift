//: Playground - noun: a place where people can play

import UIKit

var emptyDict1: Dictionary<String, String> = [:]
var emptyDict2: [String : String] = [:]
var emptyDict3 = [String : String]()

let words = ["A": "Apple", "B": "Banana", "C": "City"]
let countOfWords = words.count

if !words.isEmpty {
    print("\(countOfWords) element(s)")
}else {
    print("empty dictionary")
}

if let aValue = words["A"] {
    print(aValue)
} else {
    print("Not Found")
}

if let zValue = words["Z"] {
    print(zValue)
} else {
    print("Not Found")
}

let keys = Array(words.keys)
print(keys)

let values = Array(words.values)
print(values)

if words.contains(where: { (key, value) -> Bool in return key == "A" } ) {
    print("contains A key.")
}

if words.contains(where: { $0.1 == "City" }) {
    print("contains City vlaue.")
}

let result = words.filter{(key, value) -> Bool in
    return value.lowercased().contains("a")
}
print(result)

// 소문자 'a'가 포함된 Dictionary벨류 출력
for (key, value) in result {
    print("\(key) = \(value)")
}

var words2 = [String : String]()
words2["A"] = "Apple"
words2["B"] = "Banana"
print(words2)

words2["B"] = "Blue"
print(words2)

if let oldValue = words2.updateValue("Apple", forKey: "A") {
    print("\(oldValue) => \(words2["A"]!)")
} else {
    print("+ \(words2["A"]!)")
}

if let oldValue = words2.updateValue("Airpot", forKey: "A") {
    print("\(oldValue) => \(words2["A"]!)")
} else {
    print("+ \(words["A"]!)")
}
