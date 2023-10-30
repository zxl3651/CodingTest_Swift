import Foundation

let N = Int(readLine()!)!
var arr : [[Int]] = []
for _ in 0..<N{
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var result : [Bool] = Array(repeating: false, count: N)
var answer : [Int] = []

func dfs(_ depth : Int, _ index : Int) {
    if (depth == N / 2){
        var start : [Int] = []
        var link : [Int] = []
        var score1 = 0
        var score2 = 0
        for i in 0..<N{
            if result[i] == true{
                start.append(i)
            }
            else {
                link.append(i)
            }
        }
        for i in 0..<N/2{
            for j in 0..<N/2{
                if i != j{
                    score1 += arr[start[i]][start[j]]
                    score2 += arr[link[i]][link[j]]
                } else {
                    continue
                }
            }
        }
        answer.append(abs(score1 - score2))
    } else {
        for i in index..<N{
            if result[i] == false {
                result[i] = true
                dfs(depth + 1, i)
                result[i] = false
            }
        }
    }
}

dfs(0, 0)
print(answer.min()!)
