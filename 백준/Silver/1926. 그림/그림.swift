import Foundation

func dfs(_ y: Int,_ x: Int) -> Int {
    let dx: [Int] = [1, 0, -1, 0]
    let dy: [Int] = [0, 1, 0, -1]
    var result = 0
    
    for i in 0..<4 {
        let my = y + dy[i]
        let mx = x + dx[i]
        if my >= 0 && my < N && mx >= 0 && mx < M {
            if arr[my][mx] == 1 && !flag[my][mx] {
                flag[my][mx] = true
                result += (1 + dfs(my, mx))
            }
        }
    }
    
    return result
}

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (N, M) = (input[0], input[1])

var arr = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
var flag = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
var count = 0 // 그림의 개수
var area = 0

for i in 0..<N {
    arr[i] = readLine()!.split(separator: " ").map{ Int($0)! }
}

for y in 0..<N {
    for x in 0..<M {
        if arr[y][x] == 1 && !flag[y][x] { // 그림 발견
            flag[y][x] = true
            let result = 1 + dfs(y, x)
            if area < result {
                area = result
            }
            count += 1
        }
    }
}

print(count)
print(area)
