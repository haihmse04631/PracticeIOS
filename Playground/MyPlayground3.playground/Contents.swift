//: Playground - noun: a place where people can play

import UIKit

//class Person {
//    var name: String
//
//    init(_ name: String) {
//        self.name = name
//        print("\(self.name) is initization")
//    }
//
//    deinit {
//        print("\(self.name) is deinit!")
//    }
//}
//
//class Sample {
//    var reference1 = Person("Ice Tea")
//
//}
//func mSwap(_ numberA: inout Int,_ numberB: inout Int) {
//    let temp = numberA
//    numberA = numberB
//    numberB = temp
//}
//
//var a = 10
//var b = 12
//mSwap(&a, &b)
//print("a = \(a) : b = \(b)")

var shoppingList = ["key":"value"]

// Initialize the dictionary
func callSomeMethodWithParams(_ params: [AnyHashable: Any], onSuccess success: @escaping (_ JSON: Any) -> Void, onFailure failure: @escaping (_ error: Error?, _ params: [AnyHashable: Any]) -> Void) {
    
    print("\n" + String(describing: params))
    
    let error: Error? = NSError(domain:"", code:1, userInfo:nil)
    
    var responseArray: [Any]?
    responseArray = [1,2,3,4,5]
    
    if let responseArr = responseArray {
        success(responseArr)
    }
    if let err = error {
        failure(err, params)
    }
    
}

callSomeMethodWithParams(shoppingList, onSuccess: { (JSON) in
    print("\nSuccess. Response received...: " + String(describing: JSON))
}) { (error, params) in
    if let err = error {
        print("\nError: " + err.localizedDescription)
    }
    print("\nParameters passed are: " + String(describing:params))
}


