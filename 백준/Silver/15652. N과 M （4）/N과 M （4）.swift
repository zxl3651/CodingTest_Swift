import Foundation

func dfs(_ start : Int){
    if result.count == M{
            answer += "\(result.map{ String($0)}.joined(separator: " "))\n"
    } else {
        for i in start...N{
            result.append(i)
            dfs(i)
            result.removeLast()
        }
    }
}

var input = readLine()!.split(separator: " ").map{ Int($0)! }
let (N, M) = (input[0], input[1])
var result : [Int] = []
var index = 1
var answer = ""
dfs(1)
print(answer)