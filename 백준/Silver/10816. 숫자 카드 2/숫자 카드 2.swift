import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int($0)! }
let M = Int(readLine()!)!
var find = readLine()!.split(separator: " ").map{ Int($0)! }

var dict : [Int: Int] = [:]
for i in arr {
    if dict[i] == nil{
        dict[i] = 1
    } else {
        dict[i]! += 1
    }
}
var answer = ""
for i in find{
    if dict[i] == nil{
        answer += "\(0) "
    } else{
        answer += "\(dict[i]!) "
    }
}
print(answer)
