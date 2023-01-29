import UIKit

let name = "Taylor"

for i in name {
    print(i)
}
let letter = name[name.index(name.startIndex, offsetBy: 3)]

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

let letter2 = name[3]

let weather = "in's going to rain"
weather.capitalized


let input = "Swift is like Objective-C without the C"

input.contains("Swift")

let languages = ["Python", "Ruby", "Swift"]
languages.contains("Swift")

input.contains(languages[2])

languages.contains(where: input.contains)
