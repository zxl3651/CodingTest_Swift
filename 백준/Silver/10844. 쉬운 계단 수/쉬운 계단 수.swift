import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: 101)
let mod = 1000000000
var cnt = 0

for i in 0...9 {
    dp[1][i] = 1
}

if n > 1 {
    for i in 2...n {
        for j in 0...9 {
            if j == 0 {
                dp[i][j] = dp[i-1][j+1] % mod
            } else if j == 9 {
                dp[i][j] = dp[i-1][j-1] % mod
            } else {
                dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % mod
            }
        }
    }
}
for i in 1...9{
    cnt = (cnt + dp[n][i]) % mod
}

print(cnt)
