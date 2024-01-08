import Foundation

let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map{ Int($0)! }
let m = Int(readLine()!)!
var find = readLine()!.split(separator: " ").map{ Int($0)! }

var dic : [Int : Int] = [:]
for i in a{
    dic[i] = 1
}

var answer = ""

for i in find{
    if dic[i] == 1{
        answer += "\(1)\n"
    } else {
        answer += "\(0)\n"
    }
}
print(answer)
