//: Playground - noun: a place where people can play

import UIKit

let emptyStrArray1: Array<String> = []
let emptyStrArray2 = Array<String>()
let emptyStrArray3: [String] = []
let emptyStrArray4  = [String]()

let intArray = [1, 2, 3]
let doubleArray = Array(repeating: 0.0, count: 10)

let fruits = ["Apple", "Orange", "Banana"]

let fruit = fruits[0]
let last = fruits[2]

let alphabet2: NSArray = ["A", "B", "C", "D", "E"]

if alphabet2.contains("A") {
    print("A")
}

//if alphabet.contains(where: { $0 == "A" } ) {
//    print("contains A")
//}

let alphabet = ["A", "B", "C", "D", "E"]

if let index = alphabet.index(of: "C"){
    print("index of C : \(index)")
}

var alphabet3 = [String()]
alphabet3.append("B")
alphabet3 += ["C"]
alphabet3.insert("A", at: 0)

var alphabet4 = ["A", "B", "C"]
alphabet4[0] = "Z"

var alphabet5 = ["A", "B", "C"]
//alphabet5[alphabet5.startIndex ..< alphabet5.endIndex.advanced(by: -1)] = ["X", "Y"]
//위의 코드와 동일함
alphabet5[alphabet5.startIndex ..< alphabet5.endIndex - 1] = ["X", "Y"]
alphabet5

alphabet5 = ["A", "B", "C", "D", "E"]
let removed = alphabet5.remove(at: 0)

print(removed)
print(alphabet5)

alphabet5.removeAll(keepingCapacity: true)

var alphabet6 = ["A", "B", "C", "D", "E"]

for i in 0 ..< (alphabet6.count - 1) {
    let j = Int(arc4random_uniform(UInt32(alphabet6.count - i))) + i
    guard i != j else { continue }
    swap(&alphabet6[i], &alphabet6[j])
}
print(alphabet6)

//sorted()는 원본을 바꾸지 않음
let sortedArray = alphabet6.sorted()
print(sortedArray)

//sort()는 원본을 바꿈
alphabet6.sort()
print(alphabet6)

let alphabet7 = ["A", "B", "C", "D", "E"]
var result = alphabet7.reversed()
print(result)

var result2: [String] = alphabet7.reversed()
print(result2)

//상동
result2 = [String](alphabet7.reversed())
print(result2)

let alphabet8 = ["A", "B", "C", "D", "E"]
let result3 = alphabet8.map { $0.lowercased() }
print(result3)

let array = ["Apple", "Orange", "Melon"]
for value in array {
    if let index = array.index(of: value) {
        print("\(index) - \(value)")
    }
}

let alphabet9 = ["A", "B", "C"]
for t in alphabet9.enumerated() {
    print("#\(t.0) - \(t.1)")
}
print("=========================================")
for (index, char) in alphabet9.enumerated() {
    print("#\(index) - \(char)")
}
