import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, c) = (input[0], input[1])

var arr = [Int]()

for _ in 0..<n{
    arr.append(Int(readLine()!)!)
}

arr.sort()
var left = 1
var right = arr.max()!
var answer = 0

while(left <= right){
    var start = arr[0]
    var cnt = 1
    var mid = (left + right) / 2
    
    for i in 0..<n{
        let d = arr[i] - start
        if mid <= d {
            cnt += 1
            start = arr[i]
        }
    }
    
    if c <= cnt{
        answer = mid
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(answer)
