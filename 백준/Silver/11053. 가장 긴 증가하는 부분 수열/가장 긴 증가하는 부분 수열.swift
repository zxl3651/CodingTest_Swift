import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }
var dp = [Int](repeating: 1, count: n)

var answer = 0
for i in 0..<n{
    for j in 0...i{
        if arr[j] < arr[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
        if answer < dp[i] {
            answer = dp[i]
        }
    }
}

print(answer)