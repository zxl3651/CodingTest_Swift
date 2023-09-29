import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (N, M) = (input[0], input[1])

var S : [String : Int] = [:]
for _ in 0..<N{
    let c = readLine()!
    if S[c] == nil{
        S[c] = 1
    }
}
var answer = 0
for _ in 0..<M{
    let c = readLine()!
    if S[c] == 1{
        answer += 1
    }
}
print(answer)
