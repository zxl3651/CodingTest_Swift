func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var map = [[String]]()
    for i in 0..<board.count {
        map.append(board[i].map{ String($0) })
    }
    
    var answer = 0
    
    let dy = [0, 1, 1]
    let dx = [1, 0, 1]
    
    // 2x2 가 같다면 visited => true
    while true {
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        var flag = true
        // 모두 돌고 true인 부분 0로 변경
        for y in 0..<m {
            for x in 0..<n {
                // 현재 위치, 우, 하, 대각 우하
                var result = [[y, x]]
                if map[y][x] == "0" {
                    continue
                }
                for i in 0..<3 {
                    let ny = y + dy[i]
                    let nx = x + dx[i]
                    if ny >= m || ny < 0 || nx >= n || nx < 0 {
                        break
                    }
                    if map[y][x] != map[ny][nx] {
                        break
                    }
                    result.append([ny, nx])
                }
                if result.count >= 4 {
                    for i in 0..<result.count {
                        flag = false
                        visited[result[i][0]][result[i][1]] = true
                    }
                }
            }
        }
        if flag {
            break
        }
        
        // 다시 돌며 0면 위부분 하나씩 당겨오기
        for y in 0..<m {
            for x in 0..<n {
                if visited[y][x] == true {
                    for i in stride(from: y, to: 0, by: -1) {
                        map[i][x] = map[i-1][x]
                    }
                    map[0][x] = "0"
                    answer += 1
                }
            }
        }
    }
    
    return answer
}
