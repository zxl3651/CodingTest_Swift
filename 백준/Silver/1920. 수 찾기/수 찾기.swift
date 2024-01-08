import Foundation

let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map{ Int($0)! }
let m = Int(readLine()!)!
var find = readLine()!.split(separator: " ").map{ Int($0)! }

var dic : [Int : Int] = [:]
for i in a{
    dic[i] = 1
}

for i in find{
    if dic[i] == 1{
        print(1)
    } else {
        print(0)
    }
}