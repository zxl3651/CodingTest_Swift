import Foundation

let N = Int(readLine()!)!

var arr : [[Int]] = []
var dp : [[Int]] = []
for _ in 1...N{
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}
for i in 1..<N{
    arr[i][0] = min(arr[i-1][1] + arr[i][0], arr[i-1][2] + arr[i][0])
    arr[i][1] = min(arr[i-1][0] + arr[i][1], arr[i-1][2] + arr[i][1])
    arr[i][2] = min(arr[i-1][0] + arr[i][2], arr[i-1][1] + arr[i][2])
}
print(arr[N-1].min()!)