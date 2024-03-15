import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (input[0], input[1])

var arr = [[Int]]()
var move = [(Int, Int)]()

for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

for _ in 0..<m {
    input = readLine()!.split(separator: " ").map{ Int($0)! }
    move.append((input[0], input[1]))
}

var cloud = [(n-1, 0), (n-1, 1), (n-2, 0), (n-2, 1)]

for i in 0..<m {
    // 구름 이동
    moveCloud(move[i].0, move[i].1)
    
    var visited = [[Bool]](repeating: [Bool](repeating: true, count: n), count: n)
    
    // 구름이 있는 칸에 물의 양 + 1
    for j in 0..<cloud.count {
        arr[cloud[j].0][cloud[j].1] += 1
        visited[cloud[j].0][cloud[j].1] = false
    }
    
    // 구름이 있는 칸의 대각선 방향 체크하고 물이 있다면 수만큼 +1
    for j in 0..<cloud.count {
        // 왼쪽위, 오른쪽위, 오른쪽아래, 왼쪽아래
        let check = [(cloud[j].0 - 1, cloud[j].1 - 1), (cloud[j].0 - 1, cloud[j].1 + 1), (cloud[j].0 + 1, cloud[j].1 + 1), (cloud[j].0 + 1, cloud[j].1 - 1)]
        var cnt = 0
        for k in 0..<check.count {
            // 만약 벗어난다면 무시
            if check[k].0 < 0 || check[k].1 < 0 || check[k].0 >= n || check[k].1 >= n {
                continue
            }
            if arr[check[k].0][check[k].1] > 0 {
                cnt += 1
            }
        }
        arr[cloud[j].0][cloud[j].1] += cnt
    }
    
    // 구름 사라짐
    cloud.removeAll()
    
    // 구름 체크
    for j in 0..<n {
        for k in 0..<n {
                if arr[j][k] >= 2 && visited[j][k] {
                    cloud.append((j, k))
                    arr[j][k] -= 2
                }
            
        }
    }
}

func moveCloud(_ dir: Int, _ num: Int) {
    for _ in 0..<num {
        if dir == 1 {
            for j in 0..<cloud.count {
                cloud[j].1 -= 1
                if cloud[j].1 < 0 {
                    cloud[j].1 = n - 1
                }
            }
        } else if dir == 2 {
            for j in 0..<cloud.count {
                cloud[j].0 -= 1
                cloud[j].1 -= 1
                if cloud[j].0 < 0 {
                    cloud[j].0 = n - 1
                }
                if cloud[j].1 < 0 {
                    cloud[j].1 = n - 1
                }
            }
        } else if dir == 3 {
            for j in 0..<cloud.count {
                cloud[j].0 -= 1
                if cloud[j].0 < 0 {
                    cloud[j].0 = n - 1
                }
            }
        } else if dir == 4 {
            for j in 0..<cloud.count {
                cloud[j].0 -= 1
                cloud[j].1 += 1
                if cloud[j].0 < 0 {
                    cloud[j].0 = n - 1
                }
                if cloud[j].1 >= n {
                    cloud[j].1 = 0
                }
            }
        } else if dir == 5 {
            for j in 0..<cloud.count {
                cloud[j].1 += 1
                if cloud[j].1 >= n {
                    cloud[j].1 = 0
                }
            }
        } else if dir == 6 {
            for j in 0..<cloud.count {
                cloud[j].0 += 1
                cloud[j].1 += 1
                if cloud[j].0 >= n {
                    cloud[j].0 = 0
                }
                if cloud[j].1 >= n {
                    cloud[j].1 = 0
                }
            }
        } else if dir == 7 {
            for j in 0..<cloud.count {
                cloud[j].0 += 1
                if cloud[j].0 >= n {
                    cloud[j].0 = 0
                }
            }
        } else if dir == 8 {
            for j in 0..<cloud.count {
                cloud[j].0 += 1
                cloud[j].1 -= 1
                if cloud[j].0 >= n {
                    cloud[j].0 = 0
                }
                if cloud[j].1 < 0 {
                    cloud[j].1 = n - 1
                }
            }
        }
    }
}

var answer = 0
for i in 0..<n {
    for j in 0..<n {
        answer += arr[i][j]
    }
}

print(answer)
