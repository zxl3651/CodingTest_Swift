import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (input[0], input[1])

var arr = readLine()!.split(separator: " ").map{ Int($0)! }
var prefix = [Int](repeating: 0, count: n)
var count = [Int](repeating: 0, count: m)

for i in 0..<n{
    if i == 0{
        prefix[i] = arr[i]
    } else {
        prefix[i] = arr[i] + prefix[i - 1]
    }
    count[prefix[i] % m] += 1
}

var answer = 0

for i in 0..<m{
    answer += (count[i] * (count[i] - 1)) / 2
}
print(answer + count[0])
