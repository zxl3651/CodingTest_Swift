import Foundation

var answer : [Int] = []
var answer_str = ""

func dfs(){
    if answer.count == M{
        answer_str += "\(answer.map({String($0)}).joined(separator: " "))\n"
    } else {
        for i in 1...N{
            answer.append(i)
            dfs()
            answer.removeLast()
        }
    }
    
}

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (N, M) = (input[0], input[1])

dfs()
print(answer_str)
