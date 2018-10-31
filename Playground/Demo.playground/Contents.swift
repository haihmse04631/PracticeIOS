//: Playground - noun: a place where people can play

import UIKit
// Delegation sample
protocol ExampleDelegate {
    func doAnything()
}

class DetailWork {
    var delegate: ExampleDelegate?
    func doWork(){
        print("Hello")
        print("I'm Ice Tea")
        delegate?.doAnything()
        print("Good bye!")
    }
}

class ClassComformDelegate: ExampleDelegate {
    var aDelegate: DetailWork
    init(aDelegate: DetailWork) {
        self.aDelegate = aDelegate
        self.aDelegate.delegate = self
        self.aDelegate.doWork()
    }
    
    func doAnything() {
        print("I'm a Developer ^^")
    }
}

let a = ClassComformDelegate(aDelegate: DetailWork())

class Person {
    
    final func identity() -> String {
        return "one human"
    }
    
    class func name() -> String {
        return "My Name ..."
    }
    
    static func eat() -> String {
        return "yum yum"
    }
    
    func job() -> String {
        return "work work"
    }
    
}

class Developer: Person {
    override func job() -> String {
        //return super.job() // can return super.job() instead return spetify string
        return "developer"
    }
    
    func name() -> String {
        return "my name's: Ice Tea!"
    }
    
    func eat() -> String {
        return "Snack"
    }

}

let dev = Developer()

class Position {
    
}
