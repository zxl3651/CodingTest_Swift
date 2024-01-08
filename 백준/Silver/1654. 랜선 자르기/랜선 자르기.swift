import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (k, n) = (input[0], input[1])

var arr = [Int]()

for _ in 0..<k{
    arr.append(Int(readLine()!)!)
}

arr.sort()

var start = 1
var end = arr[arr.count-1]
var answer = 0

while(start <= end) {
    let mid = (start + end) / 2
    var cnt = 0
    for i in arr{
        cnt += (i / mid)
    }
    
    if cnt >= n{
        if answer < mid{
            answer = mid
        }
        start = mid + 1
    } else if cnt < n {
        end = mid - 1
    }
}

print(answer)