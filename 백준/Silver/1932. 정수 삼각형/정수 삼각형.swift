import Foundation

let n = Int(readLine()!)!
var dp = [Int]()

dp = readLine()!.split(separator: " ").map{ Int($0)! }

for _ in 0..<n-1{
    var arr = readLine()!.split(separator: " ").map{ Int($0)! }
    for i in 0..<arr.count{
        if i == 0{
            arr[i] += dp[i]
        } else if i == arr.count-1 {
            arr[i] += dp[i-1]
        } else {
            arr[i] = max( dp[i-1] + arr[i], dp[i] + arr[i])
        }
    }
    dp = arr
}
print(dp.max()!)
