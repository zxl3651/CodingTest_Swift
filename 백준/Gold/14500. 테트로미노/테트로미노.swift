import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (input[0], input[1])

var map = [[Int]]()

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

let dx = [[1,2,3], [0,0,0], [1,0,1], [0,0,1], [1,2,2], [1,1,1], [0,1,2], [1,1,1],[0,1,2], [1,0,0], [1,2,2], [1,1,2],[0,1,0], [1,1,2], [1,1,1], [1,1,0], [1,1,2],[0,1,1], [1,1,2]]
let dy = [[0,0,0], [1,2,3], [0,1,1], [1,2,2], [0,0,-1],[0,1,2], [-1,-1,-1], [0,-1,-2], [-1,0,0], [0,1,2],[0,0,1], [0,1,0], [1,1,2],[0,-1,0], [0,-1,1],[0,-1,1], [0,1,1],[1,1,2], [0,-1,-1]]

var answer = 0

func total(_ y: Int, _ x: Int) -> Int {
    var result = 0
    for i in 0..<19 {
        var temp = map[y][x]
        for j in 0..<3 {
            let ny = y + dy[i][j]
            let nx = x + dx[i][j]
            
            if ny >= n || ny < 0 || nx >= m || nx < 0 {
                temp = 0
                break
            }
            temp += map[ny][nx]
        }
        result = max(result, temp)
    }
    return result
}

for y in 0..<n {
    for x in 0..<m {
        // 모든 도형의 경우의 수를 확인
        answer = max(answer, total(y, x))
    }
}

print(answer)
