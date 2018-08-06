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

