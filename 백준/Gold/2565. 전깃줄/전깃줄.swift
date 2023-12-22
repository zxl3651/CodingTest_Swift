import Foundation

let n = Int(readLine()!)!
var arr : [(Int, Int)] = []

var dp = [Int](repeating: 1, count: n)

for i in 0..<n{
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    arr.append((input[0], input[1]))
}

arr = arr.sorted (by: {
    $0.0 < $1.0
})

var array = [Int]()

arr.forEach {
    array.append($0.1)
}

for i in 0..<n{
    for j in 0...i{
        if array[j] < array[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(n - dp.max()!)