//: Playground - noun: a place where people can play

import UIKit

let val1 = 1
let val2 = 2
let obj = NSNumber(value: val1)

let list : [Any] = [val1, val2, obj]

let val3 = 1
let val4 = "str"
let obj2 = NSNumber(value: true)

let list2 : [Any] = [val3, val4, obj2]

for item in list2 {
    switch item {
    case let thisItem as Int:
        print("int \(thisItem)")
    case let str as String:
        print("string \(str)")
    case let obj where obj2 is NSNumber:
        print("nsnumber")
    default:
        break
    }
}

let val5 = 1
let val6 = "str"
let obj3 = NSNumber(value: true)

let list3 : [AnyObject] = [obj]

protocol MediaPlayable {
    func play()
    func stop() -> Bool
    var isOn : Bool { get }
}

struct iPod : MediaPlayable {
    var iOSVersion = 10.0
    var isOn : Bool = true
    
    func play() {
        print("play")
    }
    
    func stop() -> Bool {
        print("stop")
        return true
    }
}

let pod = iPod()
pod.play()
pod.iOSVersion

let mediaDevice : MediaPlayable = iPod()
mediaDevice.play()

struct Walkman : MediaPlayable {
    var androidVersion = 6.0
    var isOn: Bool = true
    
    func play() {
        print("play")
    }
    
    func stop() -> Bool {
        print("stop")
        return true
    }
}

let pod2 = iPod()
let sw = Walkman()

//let list4: [MediaPlayable] = [pod, sw]
//
//for device in list4 {
//    device.play()
//}

func repare(device: MediaPlayable) {
    if device is iPod {
        print("apple a/s")
    }else if device is Walkman {
        print("sony a/s")
    }
}

repare(device: pod2)
repare(device: sw)