import Foundation

let N = Int(readLine()!)!
var numberCard = readLine()!.split(separator: " ").map{Int($0)!}
let M = Int(readLine()!)!
var find = readLine()!.split(separator: " ").map{Int($0)!}

var dict : [Int:Int] = [:]
for i in numberCard{
    if dict[i] == nil{
        dict[i] = 1
    }
}
var answer = ""
for i in find{
    if dict[i] == nil{
        answer += "0 "
    } else {
        answer += "1 "
    }
}
print(answer)
