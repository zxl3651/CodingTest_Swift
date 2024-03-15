import Foundation

// 치킨집을 1 ..< M개 까지 고르면서 각각의 치킨거리를 구해 저장
// 각 집마다 고른 치킨집을 기준으로 치킨거리를 구함
// 가장 작은 치킨거리를 출력

var input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (input[0], input[1])

var arr = [[Int]]()
var home: [(Int, Int)] = []
var chicken: [(Int, Int)] = []

for i in 0..<n {
    input = readLine()!.split(separator: " ").map{ Int($0)! }
    for j in 0..<input.count {
        if input[j] == 1 {
            home.append((i, j))
        } else if input[j] == 2 {
            chicken.append((i, j))
        }
    }
    arr.append(input)
}

// 정상 입력 완료!
var selectedChicken = [(Int,Int)]()
var answer = Int.max

func dfs(_ depth: Int) {
    if selectedChicken.count == m {
        // 치킨 거리 구하기
        var result = 0
        for i in 0..<home.count {
            var diff = Int.max
            for j in 0..<selectedChicken.count {
                diff = min(diff, abs(home[i].0 - selectedChicken[j].0) + abs(home[i].1 - selectedChicken[j].1))
            }
            result += diff
        }
        answer = min(answer, result)
        return
    }
    for i in depth..<chicken.count {
        selectedChicken.append(chicken[i])
        dfs(i + 1)
        selectedChicken.removeLast()
    }
}

dfs(0)

print(answer)
