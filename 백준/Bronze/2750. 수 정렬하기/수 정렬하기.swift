import Foundation

let N = Int(readLine()!)!
var arr : [Int] = []
for _ in 0..<N{
    arr.append(Int(readLine()!)!)
}
arr.sort()
for i in 0..<N{
    print(arr[i])
}
