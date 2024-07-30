import Foundation

var N = readLine()!.split(separator: " ").map{ Int($0)! }
let chess : [Int] = [1,1,2,2,2,8]
var answer = [Int](repeating: 6, count: 0)
for i in 0..<chess.count {
    answer.append(chess[i] - N[i])
}

answer.forEach {
    print($0, terminator: " ")
}
