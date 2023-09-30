import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (N,M) = (input[0], input[1])

var A = Set(readLine()!.split(separator: " ").map{ Int($0)! })
var B = Set(readLine()!.split(separator: " ").map{ Int($0)! })

print(A.subtracting(B).count + B.subtracting(A).count)
