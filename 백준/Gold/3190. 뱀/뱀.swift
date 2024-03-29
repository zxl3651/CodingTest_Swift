import Foundation

let n = Int(readLine()!)!
let k = Int(readLine()!)!
// 뱀이 움직이는 맵
var map = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    map[input[0] - 1][input[1] - 1] = 1
}
// 뱀의 방향 변환 횟수
let l = Int(readLine()!)!

var move = [(Int, String)]()

for _ in 0..<l {
    let input = readLine()!.split(separator: " ")
    move.append((Int(input[0])!, String(input[1])))
}

var cnt = 1
var index = 0

// 우하좌상
var dy = [0, 1, 0, -1]
var dx = [1, 0, -1, 0]
var d = 0

var snake = [[0, 0]]

while true {
    let head = snake.first!
    let y = head[0] + dy[d]
    let x = head[1] + dx[d]
    // 전진시키고, 조건을 확인
    if y < 0 || y >= n || x < 0 || x >= n || snake.contains([y, x]){
        break
    }
    // 사과가 있다면 사과를 없애고 그대로 유지
    if map[y][x] == 1 {
        map[y][x] = 0
    }
    // 사과가 없다면, 꼬리를 똑같이 한칸 전진
    else if map[y][x] == 0 {
        _ = snake.popLast()
    }
    snake.insert([y, x], at: 0)
    
    // x초가 끝난 뒤에 회전시킴
    if index < move.count {
        if move[index].0 == cnt {
            // 왼쪽 90도 회전
            if move[index].1 == "L" {
                d -= 1
                if d < 0 {
                    d = 3
                }
            }
            // 오른쪽 90도 회전
            else if move[index].1 == "D" {
                d += 1
                if d > 3 {
                    d = 0
                }
            }
            index += 1
        }
    }
    
    cnt += 1
}

print(cnt)