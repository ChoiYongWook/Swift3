//: Playground - noun: a place where people can play

import UIKit

class Shape {
   var color = UIColor.black
    
    init(color : UIColor) {
        self.color = color
    }
    
    func draw() {
        print("draw shape")
    }
    
}

class Rectangle : Shape {
        var cornerRadius = 0.0
}

let rect = Rectangle(color: UIColor.blue)
rect.color
rect.cornerRadius
rect.draw()

class Rectangle2: Shape {
    override func draw() {
        super.draw()
        
        print("draw rect")
        
//        super.draw()
    }
}

let rect2 = Rectangle2(color: UIColor.blue)
rect2.draw()

class Shape2 {
    var color = UIColor.black
    
    func draw() {
        print("draw shape2")
    }
}

class Rectangle3 : Shape2 {
    var cornerRadius = 0.0
    
    override func draw() {
        print("draw rect2")
    }
}

class Triangle : Shape2 {
    override func draw() {
        print("draw triangle2")
    }
}

class Circle : Shape2 {
    var radius = 50.0
    
    override func draw() {
        print("draw circle2")
    }
}

let rect3 = Rectangle3()
rect3.color
rect3.cornerRadius

let upcastedRect: Shape2 = Rectangle3()
upcastedRect.color
//upcastedRect.cornerRadius

//let downcatedRect: Rectangle3 = upcastedRect : 이렇게 하면 에러가 나서 아래처럼 문법으로 작성할것
//let downcatedRect: Rectangle3 = upcastedRect as! Rectangle3

if let downcatedRect: Rectangle3 = upcastedRect as! Rectangle3 {
    print("down cast")
}
