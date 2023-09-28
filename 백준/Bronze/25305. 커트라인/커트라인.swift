import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (N, k) = (input[0], input[1])

var arr : [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }
arr.sort(by: >)
print(arr[k-1])
