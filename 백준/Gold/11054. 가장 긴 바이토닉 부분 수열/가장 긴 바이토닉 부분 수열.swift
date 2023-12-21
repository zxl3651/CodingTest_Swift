import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int($0)! }
var arr_rev = Array(arr.reversed())

var dp_up = [Int](repeating: 1, count: n)
var dp_down = [Int](repeating: 1, count: n)
var result = [Int](repeating: 1, count: n)

for i in 0..<n{
    for j in 0...i{
        if arr[j] < arr[i] {
            dp_up[i] = max(dp_up[i], dp_up[j] + 1)
        }
    }
}

for i in 0..<n{
    for j in 0...i{
        if arr_rev[j] < arr_rev[i] {
            dp_down[i] = max(dp_down[i], dp_down[j] + 1)
        }
    }
}

dp_down = dp_down.reversed()
for i in 0..<n{
    result[i] = dp_up[i] + dp_down[i] - 1
}

print(result.max()!)
