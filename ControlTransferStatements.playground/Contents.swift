//: Playground - noun: a place where people can play

import UIKit

var sum = 0

for i in 0...100 {
    if i % 2 != 0 {
        break
    }
    
    sum += i
}

print(sum)
