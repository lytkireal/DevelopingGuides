//: Playground - noun: a place where people can play

import UIKit
import Darwin
import Foundation


var str = "Hello, playground"

func incrementAndPrintInOut(_ value: inout Int) {
  value += 10
  print(value)
}

func incrementAndPrint(_ value: inout Int) {
  value += 10
  print(value)
}

var value = 70
incrementAndPrintInOut(&value)
print(value)

class MyClass {
  weak var myVar: UIView?
  let myVar2: NSString = "lala"
}

infix operator **=

func **=(lhs: inout Int, rhs: Int) {
  lhs = lhs ** rhs
}
