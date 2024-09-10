import Foundation

var N = Int(readLine()!)!
var map = [[Int]]()
for i in 0..<N {
    map.append(readLine()!.map{Int(String($0))!})
}
var flag = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)

var dx = [1, 0, -1, 0]
var dy = [0, -1, 0, 1]
var answer = [Int]()

func checkHome(_ y: Int,_ x: Int) -> Int {
    var num = 1
    flag[y][x].toggle()
    for i in 0..<4 {
        if (y + dy[i]) >= N || (y + dy[i]) < 0 || (x + dx[i]) >= N || (x + dx[i]) < 0 {
            continue
        }
        if flag[y + dy[i]][x + dx[i]] {
            continue
        }
        if map[y + dy[i]][x + dx[i]] == 1 {
            num += checkHome(y + dy[i], x + dx[i])
        }
    }
    return num
}

for y in 0..<N {
    for x in 0..<N {
        // 만약 이미 단지에 소속되어있다면
        if flag[y][x] {
            continue
        }
        // 만약 1이라면
        if map[y][x] == 1 {
            answer.append(checkHome(y, x))
        }
    }
}

answer.sort()
print(answer.count)
for i in 0..<answer.count {
    print(answer[i])
}

