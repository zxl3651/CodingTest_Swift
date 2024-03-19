import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (input[0], input[1])

var map = [[Int]]()
var virus = [[Int]]()
var wall = [[Int]]()

for i in 0..<n {
    input = readLine()!.split(separator: " ").map{ Int($0)! }
    for j in 0..<m {
        if input[j] == 2 {
            virus.append([i, j])
        } else if input[j] == 0 {
            wall.append([i, j])
        }
    }
    map.append(input)
}

func countVirus(y: Int, x: Int, map: [[Int]]) -> [[Int]] {
    var temp = map
    
    let dy = [1, -1, 0, 0]
    let dx = [0, 0, -1, 1]
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny >= n || ny < 0 || nx >= m || nx < 0 {
            continue
        }
        
        if temp[ny][nx] == 0 {
            temp[ny][nx] = 2
            temp = countVirus(y: ny, x: nx, map: temp)
        }
    }
    return temp
}

func total() -> Int {
    var temp = map
    // 모든 바이러스 위치에서 퍼트리기
    for i in 0..<virus.count {
        temp = countVirus(y: virus[i][0], x: virus[i][1], map: temp)
    }
    // 안전영역 세기
    var result = 0

    for y in 0..<n {
        for x in 0..<m {
            if temp[y][x] == 0 {
                result += 1
            }
        }
    }
    return result
}

var answer = 0
// 벽 3개 세우기
for i in 0..<wall.count {
    for j in i+1..<wall.count {
        for k in j+1..<wall.count {
            map[wall[i][0]][wall[i][1]] = 1
            map[wall[j][0]][wall[j][1]] = 1
            map[wall[k][0]][wall[k][1]] = 1
            // 그 이후 바이러스 퍼트리기
            answer = max(answer, total())
            
            map[wall[i][0]][wall[i][1]] = 0
            map[wall[j][0]][wall[j][1]] = 0
            map[wall[k][0]][wall[k][1]] = 0
        }
    }
}

print(answer)
