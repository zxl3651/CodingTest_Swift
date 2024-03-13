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
    // 현재 칸이 청소 가능이면 청소
    if arr[r][c] == 0 {
        arr[r][c] = 2
        answer += 1
    }
    
    // 주변 4칸이 청소가능할때, 방향을 90도 반시계방향으로 회전 후 한칸 전진여부 확인, 전진할 수 있으면 전진
    if arr[r-1][c] == 0 || arr[r+1][c] == 0 || arr[r][c-1] == 0 || arr[r][c+1] == 0 {
        d = d == 0 ? 3 : d - 1
        
        switch d {
        case 0 : r = arr[r-1][c] == 0 ? r - 1 : r
        case 1 : c = arr[r][c+1] == 0 ? c + 1 : c
        case 2 : r = arr[r+1][c] == 0 ? r + 1 : r
        case 3 : c = arr[r][c-1] == 0 ? c - 1 : c
        default: break
        }
    } 
    // 청소 불가능할때, 후진 후 벽이라면 종료
    else {
        switch d {
        case 0 : r += 1
        case 1 : c -= 1
        case 2 : r -= 1
        case 3 : c += 1
        default: break
        }
        
        if arr[r][c] == 1 {
            break
        }
    }
}

print(answer)