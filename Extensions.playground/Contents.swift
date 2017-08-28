//: Playground - noun: a place where people can play

import UIKit

public let π = M_PI

extension Double {
    var radianValue: Double {
        return (π * self) / 100.0
    }
    
    var degreeValue: Double {
        return self * 180.0 / π
    }
}

let degreeValue = 45.0
print("\(degreeValue) degree = \(degreeValue.radianValue) radian")

let radianValue = 3.0
print("\(radianValue) radian = \(radianValue.degreeValue) degree")

extension Date {
    func toString(format: String = "yyyyMMdd") -> String{
        let privateFormatter = DateFormatter()
        privateFormatter.dateFormat = format
        return privateFormatter.string(from: self)
    }
}

let today = Date()
print(today.toString())
print(today.toString(format: "MM/dd/yyyy"))

extension Double {
    init(sizeInKB: Double){
        self = sizeInKB * 1024.0
    }
    
    init(sizeInMB: Double) {
        self = sizeInMB * 1024.0 * 1024.0
    }
}

let fileSize = Double(sizeInKB: 20)
print(fileSize)

let dirSize = Double(sizeInMB: 700)
print(dirSize)

extension String {
    subscript(idx: Int) -> String? {
        if idx >= self.characters.count || idx < 0 {
            return nil
        }
        
        return String(self.characters[self.index(self.startIndex, offsetBy: idx)])
    }
}

let str = "Swift Language"
if let char = str[2] {
    print(char)
}else {
    print("out of bounds")
}

if let char = str[23] {
    print(char)
}else {
    print("out of bounds")
}

func +(lhs: String, rhs: [String]) -> String {
    let str = rhs.joined()
    return lhs + str
}

let str2 = "Swift"
let list = ["3.0", "Programming"]
let result = str2 + list

class SizeObject{
    var width = 0.0
    var height = 0.0
    
    class final func +(lhs: SizeObject, rhs: SizeObject) -> SizeObject {
        let result = SizeObject()
        result.width = lhs.width + rhs.width
        result.height = lhs.height + rhs.height
        return result
    }
}

let s1 = SizeObject(); s1.width = 100; s1.height = 100
let s2 = SizeObject(); s2.width = 100; s2.height = 100

let result2 = s1 + s2

struct SizeValue{
    var width = 0.0
    var height = 0.0
    
    static func ==(lhs: SizeValue, rhs: SizeValue) -> Bool {
        return lhs.width == rhs.width && lhs.height == rhs.height
    }
}

let s3 = SizeValue()
let s4 = SizeValue()

var result3 = s3 == s4

struct SizeValue2{
    var width = 0.0
    var height = 0.0
    
    static prefix func -(op: SizeValue2) -> SizeValue2 {
        return SizeValue2(width: -op.width, height: -op.height)
    }
}

let size = SizeValue2(width: 100, height: 200)
let result4 = size

result4.width
result4.height

infix operator ---: AdditionPrecedence
func ---(lhs: String, rhs: String) -> String{
    return lhs.replacingOccurrences(of: rhs, with: "")
}

let source = "Swift 3.0 Programming"

var result5 = source --- "."

result5 = source --- "Programming"

infix operator ----: AdditionPrecedence
extension String{
    static func ----(lhs: String, rhs: String) -> String{
        return lhs.replacingOccurrences(of: rhs, with: "")
    }
}