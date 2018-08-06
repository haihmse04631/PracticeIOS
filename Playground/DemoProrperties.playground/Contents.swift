//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Patient {
    var name: String
    let yearOfBirth: Int
}

var mPatient = Patient(name: "IceTea", yearOfBirth: 15)
mPatient.name = "Ahihi"
var mPatient2 = Patient(name: "Ahoho", yearOfBirth: 20)
print("mPatient \(mPatient.name) - mPatient2: \(mPatient2.name)")


