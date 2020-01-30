import UIKit


let x = "90210"
let index = x.index(x.endIndex, offsetBy: -3)
let sub = x.suffix(from: index)
let result = Int(String(sub))! * 2


