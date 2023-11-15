import Foundation

let N = Int(readLine()!)!

var arr = readLine()!.split(separator: " ").map{ Int($0)! }

for i in 1..<arr.count {
    let n = arr[i] + arr[i-1]
    arr[i] = max(n, arr[i])
}

print(arr.max()!)