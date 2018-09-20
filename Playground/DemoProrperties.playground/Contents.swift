//: Playground - noun: a place where people can play

import UIKit

func swap2Value<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var string1 = "Str1"
var string2 = "Str2"
swap2Value(&string1, &string2)
print("String1: \(string1) - String2: \(string2)")
var int1 = 1
var int2 = 2
swap2Value(&int1, &int2)
print("int1: \(int1) - int2: \(int2)")



