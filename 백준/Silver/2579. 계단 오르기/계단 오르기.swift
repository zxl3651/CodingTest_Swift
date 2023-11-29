import Foundation

let n = Int(readLine()!)!

var step = [Int]()
step.append(0)
var dp = Array(repeating: 0, count: n+1)

for _ in 0..<n{
    step.append(Int(readLine()!)!)
}

if n == 1{
    dp[n] = step[n]
} else if n == 2{
    dp[n] = step[n] + step[n-1]
} else {
    dp[1] = step[1]
    dp[2] = step[1] + step[2]
    for i in 3...n{
        dp[i] = max(dp[i-2], step[i-1] + dp[i-3]) + step[i]
    }
}

print(dp[n])