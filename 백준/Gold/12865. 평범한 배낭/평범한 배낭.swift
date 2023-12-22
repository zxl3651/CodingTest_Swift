import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
let n = input[0]
let k = input[1]
var pack = [(Int, Int)]()

for _ in 0..<input[0]{
    input = readLine()!.split(separator: " ").map{ Int($0)! }
    pack.append((input[0], input[1]))
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: k + 1), count: pack.count)

for i in 0..<pack.count{
    for j in 1...k{
        if i == 0{
            if pack[i].0 <= j{
                dp[i][j] = pack[i].1
            }
        } else {
            if pack[i].0 > j{
                dp[i][j] = dp[i-1][j]
            } else {
                dp[i][j] = max(dp[i-1][j], dp[i-1][j - pack[i].0] + pack[i].1)
            }
        }
    }
}
print(dp[n-1][k])
