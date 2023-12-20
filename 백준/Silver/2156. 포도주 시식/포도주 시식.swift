import Foundation

let n = Int(readLine()!)!
var answer = 0

var arr = [Int](repeating: 0, count: n+1)
var dp = [Int](repeating: 0, count: n+1)

for i in 1...n{
    arr[i] = Int(readLine()!)!
}

if n == 1 {
    dp[1] = arr[1]
} else if n == 2 {
    dp[2] = arr[1] + arr[2]
} else if n == 3 {
    dp[3] = max(arr[1] + arr[2], arr[1] + arr[3] ,arr[2] + arr[3])
} else {
    dp[1] = arr[1]
    dp[2] = arr[1] + arr[2]
    for i in 3...n{
        dp[i] = max(arr[i] + dp[i-2], arr[i] + arr[i-1] + dp[i-3], dp[i-1])
    }
}

print(dp[n])