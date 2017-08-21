//: Playground - noun: a place where people can play

import UIKit

func sayHello() {
    print("Hello, Swift!!")
}

sayHello()

func sayHello(to: String){
    print("Hello, " + to)
}

sayHello(to: "Jobs")

func sayHello2(nm name: String = "Test"){
    var buffer = name
    buffer += " Done"
    print("Hello, " + buffer)
}

sayHello2()

func reportSum(of numbers: Int...){
    var sum = 0
    for num in numbers{
        sum += num
    }
    
    print("sum : " + String(sum))
}

reportSum(of: 1, 2, 3, 4, 5)

func swap(value v1: inout Int, with v2: inout Int){
    let buffer = v1
    v1 = v2
    v2 = buffer
}

var a = 123
var b = 456
swap(value: &a, with: &b)

func sayHelloReturn() -> String {
    return "Hello, Swift Return"
}

let result = sayHelloReturn()

func sayHelloTuple() -> (test: String, year: Int) {
    //날짜 추출하기
    let date = Date()
    let calendar = Calendar.current
    let year = calendar.component(.year, from: date)
    
    return ("Hello, Swift", year)
}

sayHelloTuple().test
sayHelloTuple().year

sayHelloTuple().0
sayHelloTuple().1

let simpleClousure = { print("Hello, Clousere") }
simpleClousure()

let countingClourse = { (str: String) -> Int in
    return str.characters.count
}

let count = countingClourse("Swift")

/*
    Clousure 예제
 */

let list = ["Orange", "Apple", "Banana"]

list.sorted { $0.compare($1) == .orderedAscending }

let result2 = list.first { (str) -> Bool in
    return str.hasPrefix("A")
}
