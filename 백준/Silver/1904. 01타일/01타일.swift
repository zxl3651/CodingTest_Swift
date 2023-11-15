import Foundation

var dp = Array(repeating: -1, count: 1000001)

let N = Int(readLine()!)!

dp[1] = 1
dp[2] = 2

if N < 3 {
    print(dp[N])
} else {
    for i in 3...N{
        dp[i] = (dp[i-1] + dp[i-2]) % 15746
    }
    print(dp[N])
}