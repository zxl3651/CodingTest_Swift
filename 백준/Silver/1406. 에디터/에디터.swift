import Foundation

var left = Array(readLine()!)
let M = Int(readLine()!)!
var right : [Character] = []


for _ in 0..<M{
    let input = readLine()!
    if input == "L"{
        if !left.isEmpty{
            right.append(left.popLast()!)
        }
    } else if input == "D"{
        if !right.isEmpty {
            left.append(right.popLast()!)
        }
    } else if input == "B"{
        if !left.isEmpty{
            left.removeLast()
        }
    } else { // P일때
        left.append(input.last!)
    }
}
print(String(left) + String(right.reversed()))