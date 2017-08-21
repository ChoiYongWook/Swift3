//: Playground - noun: a place where people can play

import UIKit

//let a = 100
//let b = 200
//
////if문
//if(a <= b) {
//    print("a <= b True")
//}

let a = 9

switch a {
case 1:
    print("1")
case 2:
    print("2")
case 3, 4:
    print("3 or 4")
default:
    break
}

switch a{
case 0...10:
    print("0 ~ 10")
case 0..<10:
    print("0 ~ 9")
case 0...100:
    print("0~100")
default:
    break
}