import Foundation

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var left = 1
var right = n*n

while(left <= right){
    var mid = (left + right) / 2
    var cnt = 0
    for i in 1...n{
        cnt += min(mid / i, n) // n을 초과하지 않는 선에서의 개수
    }
    if k <= cnt{
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(left)