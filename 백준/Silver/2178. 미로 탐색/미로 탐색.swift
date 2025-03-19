import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (N, M) = (input[0], input[1])

var arr = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)

for i in 0..<N {
    arr[i] = Array(readLine()!.map{ Int(String($0))! })
}

func bfs(_ y: Int,_ x: Int) {
    let dx: [Int] = [1, 0, -1, 0]
    let dy: [Int] = [0, 1, 0, -1]
    var queue: [(Int, Int, Int)] = [(y, x, 1)]
    var index = 0
    visited[y][x] = true
    
    while queue.count > index {
        let y = queue[index].0
        let x = queue[index].1
        let total = queue[index].2
        
        if y == N-1 && x == M-1 {
            print(total)
            break
        }
        for i in 0..<4 {
            let mx = x + dx[i]
            let my = y + dy[i]
            if mx >= 0 && my >= 0 && mx < M && my < N && arr[my][mx] == 1 && !visited[my][mx] {
                visited[my][mx] = true
                queue.append((my, mx, total+1))
            }
        }
        
        index += 1
    }
}

bfs(0, 0)
