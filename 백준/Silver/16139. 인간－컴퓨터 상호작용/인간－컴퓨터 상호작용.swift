import Foundation

var s = ["-"] + readLine()!.map{ String($0) }
let q = Int(readLine()!)!
var arr = [[String: Int]](repeating: [:], count: s.count + 1)

for i in 1..<s.count{
    arr[i] = arr[i - 1]
    arr[i][s[i], default: 0] += 1
}
for _ in 0..<q{
    let input = readLine()!.split(separator: " ")
    let alpha = String(input[0]), l = Int(input[1])! + 1, r = Int(input[2])! + 1
    print(arr[r][alpha, default: 0] - arr[l-1][alpha, default: 0])
}
