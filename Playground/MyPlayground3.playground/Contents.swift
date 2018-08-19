//: Playground - noun: a place where people can play

import UIKit

class Person {
    var name: String
    
    init(_ name: String) {
        self.name = name
        print("\(self.name) is initization")
    }
    
    deinit {
        print("\(self.name) is deinit!")
    }
}

class Sample {
    var reference1 = Person("Ice Tea")
    
}
func mSwap(_ numberA: inout Int,_ numberB: inout Int) {
    let temp = numberA
    numberA = numberB
    numberB = temp
}

var a = 10
var b = 12
mSwap(&a, &b)
print("a = \(a) : b = \(b)")
