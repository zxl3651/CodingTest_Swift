import Foundation

let n = Int(readLine()!)!

var arr = readLine()!.split(separator: " ").map{ Int($0)! }
arr.sort()

var answer = 0
for i in 1...arr.count {
    answer += arr[i-1]
    if i == arr.count{
        break
    }
    arr[i] += arr[i-1]
}

print(answer)