import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
let (N, M) = (input[0], input[1])
input = readLine()!.split(separator: " ").map{ Int($0)! }
var (r, c, d) = (input[0], input[1], input[2])

var arr = [[Int]]()

for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var answer = 0

while true {
    // 후진이 불가능하다면 break
    
    // 현재 칸이 청소 가능이면 청소
    if arr[r][c] == 0 {
        arr[r][c] = 2
        answer += 1
        continue
    }
    // 현재 칸의 주변 4칸이 모두 청소 불가능할때, 바라보는 방향을 유지하고 한 칸 후진 후 다시 반복
    if !clear() {
        if d == 0 {
            let tmp = r + 1
            if tmp >= N || arr[tmp][c] == 1 {
                break
            } else {
                r += 1
            }
        } else if d == 1 {
            let tmp = c - 1
            if tmp < 0 || arr[r][tmp] == 1 {
                break
            } else {
                c -= 1
            }
        } else if d == 2 {
            let tmp = r - 1
            if tmp < 0 || arr[tmp][c] == 1 {
                break
            } else {
                r -= 1
            }
        } else {
            let tmp = c + 1
            if tmp >= M || arr[r][tmp] == 1 {
                break
            } else {
                c += 1
            }
        }
    }
    // 현재 칸의 주변 4칸 중 청소 가능하면, 반시계 방향으로 90도 회전
    else {
        d -= 1
        if d < 0 {
            d = 3
        }
        // 그 후, 바라보는 방향 기준 앞쪽이 청소가능하면 한칸 전진 후 다시 반복
        if d == 0 {
            let tmp = r - 1
            if tmp < 0 || arr[tmp][c] != 0 {
                continue
            } else {
                r -= 1
            }
        } else if d == 1 {
            let tmp = c + 1
            if tmp >= M || arr[r][tmp] != 0 {
                continue
            } else {
                c += 1
            }
        } else if d == 2 {
            let tmp = r + 1
            if tmp >= N || arr[tmp][c] != 0 {
                continue
            } else {
                r += 1
            }
        } else if d == 3 {
            let tmp = c - 1
            if tmp < 0 || arr[r][tmp] != 0 {
                continue
            } else {
                c -= 1
            }
        }
    }
}

func clear() -> Bool {
    if r - 1 >= 0 {
        if arr[r-1][c] == 0{
            return true
        }
    }
    if r + 1 < N {
        if arr[r+1][c] == 0{
            return true
        }
    }
    if c - 1 >= 0 {
        if arr[r][c-1] == 0{
            return true
        }
    } 
    if c + 1 < M {
        if arr[r][c+1] == 0{
            return true
        }
    }
    return false
}

print(answer)
