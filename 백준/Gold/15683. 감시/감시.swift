import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (input[0], input[1])

var map = [[Int]]()
var cctv = [[Int]]()
var direction = [Int]()

// d = 0 상, d = 1 우, d = 2 하, d = 3 좌
for i in 0..<n {
    input = readLine()!.split(separator: " ").map{ Int($0)! }
    for j in 0..<m {
        if input[j] != 0 && input[j] != 6 {
            // cctv의 좌표와 몇번인지 저장
            cctv.append([i, j, input[j]])
        }
    }
    map.append(input)
}

func check(y: Int, x: Int, dir: Int, map: [[Int]]) -> [[Int]] {
    var temp = map
    let d = dir % 4
    if d == 0 {
        for i in 1..<n {
            let ny = y - i
            if ny < 0 || ny >= n || temp[ny][x] == 6 {
                break
            }
            if temp[ny][x] == 0 {
                temp[ny][x] = 7
            }
        }
    } else if d == 1 {
        for i in 1..<m {
            let nx = x + i
            if nx < 0 || nx >= m || temp[y][nx] == 6 {
                break
            }
            if temp[y][nx] == 0 {
                temp[y][nx] = 7
            }
        }
    } else if d == 2 {
        for i in 1..<n {
            let ny = y + i
            if ny < 0 || ny >= n || temp[ny][x] == 6 {
                break
            }
            if temp[ny][x] == 0 {
                temp[ny][x] = 7
            }
        }
    } else if d == 3 {
        for i in 1..<m {
            let nx = x - i
            if nx < 0 || nx >= m || temp[y][nx] == 6 {
                break
            }
            if temp[y][nx] == 0 {
                temp[y][nx] = 7
            }
        }
    }
    return temp
}

func dfs(depth: Int) {
    // 모든 cctv가 방향이 결정되었을 때
    if depth == cctv.count {
        // 사각 지대 개수 구하기
        var temp = map
        for i in 0..<cctv.count {
            switch cctv[i][2] {
            case 1:
                temp = check(y: cctv[i][0], x: cctv[i][1], dir: direction[i], map: temp)
            case 2:
                temp = check(y: cctv[i][0], x: cctv[i][1], dir: direction[i], map: temp)
                temp = check(y: cctv[i][0], x: cctv[i][1], dir: direction[i] + 2, map: temp)
            case 3:
                temp = check(y: cctv[i][0], x: cctv[i][1], dir: direction[i], map: temp)
                temp = check(y: cctv[i][0], x: cctv[i][1], dir: direction[i] + 1, map: temp)
            case 4:
                temp = check(y: cctv[i][0], x: cctv[i][1], dir: direction[i], map: temp)
                temp = check(y: cctv[i][0], x: cctv[i][1], dir: direction[i] + 1, map: temp)
                temp = check(y: cctv[i][0], x: cctv[i][1], dir: direction[i] + 2, map: temp)
            case 5:
                temp = check(y: cctv[i][0], x: cctv[i][1], dir: direction[i], map: temp)
                temp = check(y: cctv[i][0], x: cctv[i][1], dir: direction[i] + 1, map: temp)
                temp = check(y: cctv[i][0], x: cctv[i][1], dir: direction[i] + 2, map: temp)
                temp = check(y: cctv[i][0], x: cctv[i][1], dir: direction[i] + 3, map: temp)
            default:
                break
            }
        }
        
        var cnt = 0
        for y in 0..<n {
            for x in 0..<m {
                if temp[y][x] == 0 {
                    cnt += 1
                }
            }
        }
        answer.append(cnt)
        return
    }
    // 아직 모든 cctv의 방향이 결정되지 않았을 때
    for i in 0..<4 {
        direction.append(i)
        dfs(depth: depth + 1)
        direction.removeLast()
    }
}
var answer = [Int]()

// 각 cctv의 모든 경우의 수를 구하고 모두 결정되었을 때 사각지대(map[y][x] == 0)의 총 개수 구하기
dfs(depth: 0)

print(answer.min()!)
