//: Playground - noun: a place where people can play

import UIKit

//typealias
typealias AudioSample = UInt16

var str = "Hello, playground"
//type inference
//optionals
//how swift treats utf8 and objective c does ?
//swift is compiled
//Tash Table : Array of Lists
//primitive data types
//guard statement


//first value is always included
for i in 0...10 {
    print("Hello GeekFactory \(i)")
    i*i
}

//exclude 10
for i in 0..<10 {
    print("Hello GeekFactory \(i)")
    i*i
}

//tuple
let httpError = (404, "Not Found")
httpError.0
httpError.1
//tuple named
let Error = (errorNumber : 404, errorString : "Not Found")
Error.errorNumber
Error.errorString

let (code,textValue) = httpError
print(code)

//arrays
var thisIsAnArray = [0...10]
print(thisIsAnArray)

//dict
var dict = ["key1": 1 , "key2": 2]
dict["key1"]

print(Int.min)
print(Int.max)

func printAndCount(string: String) ->Int{
    return string.characters.count
}

printAndCount(string: "hello, world")

class ourClass{
    var s :Int?
    var s2 = "hello"
    
    init() {
//        s = 0
    }
}

func test(){
var OurClassobject = ourClass()

//optional is an enumeration; enum is nil or type ! is wrape
OurClassobject.s ?? 10 //default value if not found

if let theValue = OurClassobject.s{
    print("value is found")
}

//guard statement
guard let otherVal = OurClassobject.s else {
    print("value is not found")
    return
}
}
test()

//implement a sorting algorithm with swift and implement it
//array of int
//array of strings











