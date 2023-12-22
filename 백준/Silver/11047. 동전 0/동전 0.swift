import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
var (n, k) = (input[0], input[1])

var index = 0
var arr = [Int]()

for _ in 0..<n{
    let money = Int(readLine()!)!
    if money <= k{
        arr.append(money)
    }
}

arr = arr.reversed()
var count = 0

for i in 0..<arr.count{
    count += k / arr[i]
    k = k % arr[i]
}

print(count)