import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
var (H, W, N, M) = (input[0], input[1], input[2], input[3])

var x = ceil(Double(W) / Double(M + 1))
var y = ceil(Double(H) / Double(N+1))
print(Int(x * y))
