import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }
var result = [arr.first!]

for i in 1..<arr.count{
    if arr[i] > result.last!{
        result.append(arr[i])
        continue
    }
    
    var start = 0
    var end = result.count
    while(start <= end){
        let mid = (start + end) / 2
        if result[mid] < arr[i]{
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    result[start] = arr[i]
}

print(result.count)
