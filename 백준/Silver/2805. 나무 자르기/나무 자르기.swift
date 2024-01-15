import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (input[0], input[1])

var arr = readLine()!.split(separator: " ").map{Int($0)!}

var start = 1
var end = arr.max()!
var answer = 0
while(start <= end){
    let mid = (start + end) / 2
    var cnt = 0
    for i in 0..<arr.count{
        if arr[i] > mid{
            cnt += (arr[i] - mid)
        }
    }
    if cnt >= m {
        start = mid + 1
        answer = mid
    } else {
        end = mid - 1
    }
}

print(answer)