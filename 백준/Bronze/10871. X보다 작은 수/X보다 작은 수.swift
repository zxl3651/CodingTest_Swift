import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (N, X) = (input[0], input[1])
var A = readLine()!.split(separator: " ").map{Int($0)!}

var answer = ""
for i in 0..<N{
    if A[i] < X{
        answer += "\(A[i]) "
    }
}
print(answer)
