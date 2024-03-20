import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, L, R) = (input[0], input[1], input[2])

var map = [[Int]]()

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var answer = 0
var visited = [[Bool]]()

let dy = [-1,1,0,0]
let dx = [0,0,-1,1]

func check(y: Int, x: Int) -> Bool {
    var queue = [(Int, Int)]()
    queue.append((y, x))
    
    var unions = [(Int, Int)]() // 연합 좌표
    unions.append((y,x))
    
    var sum = map[y][x] // 연합 인구수

    var cnt = 0
    
    while !queue.isEmpty {
        let (r, c) = queue.removeFirst()
        
        for i in 0..<4 {
            let ny = r + dy[i]
            let nx = c + dx[i]
            if ny >= n || ny < 0 || nx >= n || nx < 0 {
                continue
            }
            if visited[ny][nx] {
                continue
            }
            // 만약 조건이 맞다면
            let diff = abs(map[r][c] - map[ny][nx])
            
            if L <= diff && diff <= R {
                visited[ny][nx] = true
                queue.append((ny, nx))
                unions.append((ny, nx))
                sum += map[ny][nx]
                cnt += 1
            }
        }
        
    }
    
    if cnt != 0 {
        let result = Int(sum / unions.count)
        for union in unions {
            map[union.0][union.1] = result
        }
        return true
    } else {
        return false
    }
}

// 모든 map을 돌며 상하좌우가 조건에 부합하는지 확인
// visited 배열을 통해 연합에 포함이 되어있는지 아닌지 확인
while true {
    visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var flag = false
    
    for y in 0..<n {
        for x in 0..<n {
            if visited[y][x] == false {
                visited[y][x] = true
                if check(y: y, x: x) {
                    flag = true
                }
            }
        }
    }
    if !flag {
        break
    } else {
        answer += 1
    }
}

print(answer)
