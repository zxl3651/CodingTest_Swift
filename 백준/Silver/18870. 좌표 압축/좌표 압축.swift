import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}

var setArr = Array(Set(arr).sorted(by: <))


var answer = ""
var list : [Int : Int] = [:]

for i in 0..<setArr.count{
    if list[setArr[i]] == nil{
        list[setArr[i]] = i
    } else {
        continue
    }
}
arr.forEach{ answer += "\(list[$0]!) "}
print(answer)
