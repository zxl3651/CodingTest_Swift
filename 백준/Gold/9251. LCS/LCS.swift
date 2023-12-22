import Foundation

var x = readLine()!.map{String($0)}
var y = readLine()!.map{String($0)}
var dp = [[Int]](repeating: [Int](repeating: 0, count: x.count + 1), count: y.count + 1)

for i in 1...y.count{
    for j in 1...x.count{
        if y[i-1] == x[j-1] {
            dp[i][j] = dp[i-1][j-1] + 1
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i][j-1])
        }
    }
}

print(dp[y.count][x.count])
