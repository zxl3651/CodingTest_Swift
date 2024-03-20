import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
let (R, C, T) = (input[0], input[1], input[2])

var map = [[Int]]()
var cleaner = [Int]() // y의 값만 저장(어차피 x는 항상 0이니까)


for i in 0..<R {
    input = readLine()!.split(separator: " ").map{ Int($0)! }
    for j in 0..<C {
        if input[j] == -1 {
            cleaner.append(i)
        }
    }
    map.append(input)
}

let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]

// 미세먼지 확산(동시 확산, 칸이 없거나 공기청정기 쪽은 확산 x, 해당 칸 미세먼지 줄이고)
func increaseDust() {
    // 동시 확산 이후 더해줘야 할 미세먼지
    var temp = [[Int]](repeating: [Int](repeating: 0, count: C), count: R)
    // 동시 확산
    for y in 0..<R {
        for x in 0..<C {
            if map[y][x] != 0 && map[y][x] != -1 {
                if map[y][x] < 5 { continue } // 5보다 작으면 확산되지 않는다.
                var div = 0
                let inc = Int(map[y][x] / 5)
                // 확산 시작
                for i in 0..<4 {
                    let ny = y + dy[i]
                    let nx = x + dx[i]
                    if ny < 0 || ny >= R || nx < 0 || nx >= C { continue } // 칸 벗어남
                    if map[ny][nx] == -1 { continue } // 공기청정기
                    temp[ny][nx] += inc
                    div += 1
                }
                map[y][x] -= (inc * div)
            }
        }
    }
    
    for y in 0..<R {
        for x in 0..<C {
            map[y][x] += temp[y][x]
        }
    }
    
}

// 공기청정기 작동(미세먼지가 닿으면 제거)
func work() {
    // 위
    for i in stride(from: cleaner[0] - 1, to: 0, by: -1) {
        map[i][0] = map[i-1][0]
    }
    for i in 1..<C {
        map[0][i-1] = map[0][i]
    }
    for i in 1...cleaner[0] {
        map[i-1][C-1] = map[i][C-1]
    }
    for i in stride(from: C - 1, to: 1, by: -1) {
        map[cleaner[0]][i] = map[cleaner[0]][i - 1]
    }
    // 아래
    for i in cleaner[1]+1..<R-1 {
        map[i][0] = map[i+1][0]
    }
    for i in 0..<C-1 {
        map[R-1][i] = map[R-1][i+1]
    }
    for i in stride(from: R-1, to: cleaner[1], by: -1) {
        map[i][C-1] = map[i-1][C-1]
    }
    for i in stride(from: C-1, to: 1, by: -1) {
        map[cleaner[1]][i] = map[cleaner[1]][i-1]
    }
    map[cleaner[0]][1] = 0
    map[cleaner[1]][1] = 0
}

for _ in 0..<T {
    increaseDust()
    work()
    // 미세먼지 배열 초기화
}

// 전체 미세먼지 양 출력
var answer = 0

for y in 0..<R {
    for x in 0..<C {
        if map[y][x] > 0 {
            answer += map[y][x]
        }
    }
}
print(answer)
