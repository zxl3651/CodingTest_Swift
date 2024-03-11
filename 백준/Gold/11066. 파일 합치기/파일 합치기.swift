import Foundation

var answer = ""

let N = Int(readLine()!)!

for _ in 0..<N {
    let input = Int(readLine()!)!
    var dp = [[Int]](repeating: [Int](repeating: 0, count: input + 1), count: input + 1)
    var sum = [Int](repeating: 0, count: input + 1)
    var file = readLine()!.split(separator: " ").map{ Int($0)! }
    
    for i in 1...file.count {
        sum[i] = sum[i-1] + file[i-1]
    }
    
    for i in 1..<file.count {
        for start in 1...(file.count - i) {
            let end = start + i
            dp[start][end] = Int.max
            
            for mid in start..<end {
                dp[start][end] = min(dp[start][end], dp[start][mid] + dp[mid + 1][end] + sum[end] - sum[start - 1])
            }
        }
    }
    print(dp[1][file.count])
}
