import Foundation

let N = Int(readLine()!)!

var arr = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)

let X = Int(readLine()!)!

var (start, end) = (0, N-1)
var result = 0
while (start != end){
    let sum = arr[start] + arr[end]
    if sum == X {
        result += 1
        start += 1
    } else if sum > X {
        end -= 1
    } else {
        start += 1
    }
}
print(result)