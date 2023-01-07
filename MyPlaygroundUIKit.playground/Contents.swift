import UIKit
//MARK: - map
var number = [4.0, 9.0 ,16.0]
var final = number.map(sqrt)

//MARK: - flatMap
var flatnum = ["1", "5", "non"]
var final2 = flatnum.compactMap{Int($0)}
print(final2)
print(type(of: final2))

let num: String? = "5"
let final3 = num.map{Int($0)}
type(of: final3)
let final4 = num.flatMap{Int($0)}
type(of: final4)

//MARK: - filter

