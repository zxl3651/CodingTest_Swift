import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (input[0], input[1])

var arr = readLine()!.split(separator: " ").map{Int($0)!}

var start = 1
var end = arr.max()!
var answer = 0
while(start < end){
    let mid = (start + end) / 2
    var tmp = [Int]()
    var cnt = 0
    for i in 0..<arr.count{
        if arr[i] > mid{
            cnt += (arr[i] - mid)
            tmp.append(arr[i] - mid)
        }
    }
    if cnt >= m {
        start = mid + 1
        answer = mid
    } else {
        end = mid
    }
}

print(answer)