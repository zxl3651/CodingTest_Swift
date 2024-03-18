import Foundation

let n = Int(readLine()!)!

var arr = [[Int]](repeating: [Int](), count: n*n + 1)
var map = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

func countStudent(_ y: Int, _ x: Int, _ like: [Int]) -> (Int, Int) {
    var lover = 0
    var blank = 0
    
    // 상하좌우
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx < 0 || nx >= n || ny < 0 || ny >= n {
            continue
        }
        if like.contains(map[ny][nx]) {
            lover += 1
        }
        if map[ny][nx] == 0{
            blank += 1
        }
    }
    
    return (lover, blank)
}
// 전체 학생을 돌면서 순서대로 앉힌다.
for _ in 0..<n*n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let student = input[0] // 앉힐 학생
    arr[student] = Array(input[1..<5])
    
    var maxLover = -1
    var maxBlank = -1
    
    var x = 0
    var y = 0
    
    for j in 0..<n {
        for k in 0..<n {
            // 만약 자리 배정이 아직 되어있지 않다면
            if map[j][k] == 0 {
                let info = countStudent(j, k, arr[student])
                
                if maxLover < info.0 {
                    maxLover = info.0
                    maxBlank = info.1
                    y = j
                    x = k
                } else if maxLover == info.0 && maxBlank < info.1 {
                    maxLover = info.0
                    maxBlank = info.1
                    y = j
                    x = k
                }
            }
        }
    }
    map[y][x] = student
}

var answer = 0
var happy = [0, 1, 10, 100, 1000]

for y in 0..<n {
    for x in 0..<n {
        let info = countStudent(y, x, arr[map[y][x]])
        answer += happy[info.0]
    }
}

print(answer)