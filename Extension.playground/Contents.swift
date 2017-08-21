//: Playground - noun: a place where people can play

import UIKit

extension Double {
    var radianValue : Double {
        return (Double.pi * self) / 180.0
    }
    
    var degreeValue : Double {
        return self * 180.0 / Double.pi
    }
}

45.0.radianValue
0.78.degreeValue

extension Date {
    func toString(format: String = "yyyyMMdd") -> String {
        let privateFormatter = DateFormatter()
        privateFormatter.dateFormat = format
        return privateFormatter.string(from: self)
    }
}

let today = Date()
today.toString()