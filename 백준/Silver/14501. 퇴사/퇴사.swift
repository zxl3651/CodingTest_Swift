import Foundation

func dfs(_ num: Int, _ result: Int) {
    if num > N {
        return
    }
    
    answer = max(answer, result)
    
    for i in num..<N {
        dfs(i + arr[i].0, result + arr[i].1)
    }
}

let N = Int(readLine()!)!
var arr: [(Int, Int)] = []

var answer = 0

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    arr.append((input[0], input[1]))
}

// 완전탐색으로 각 상담 시 버는 비용 비교
dfs(0, 0)

print(answer)

