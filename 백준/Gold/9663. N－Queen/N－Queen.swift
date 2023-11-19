import Foundation

func check(_ point: Int) -> Bool {
    for i in 0..<point{
        if arr[i] == arr[point] { // 가로, 세로 확인
            return false
        }
        if abs(i - point) == abs(arr[i] - arr[point]){ // 대각선 확인
            return false
        }
    }
    return true
}

func dfs(_ num: Int) {
    if num == N{
        count += 1
    }
    
    for i in 0..<N{
        if visited[i] { continue }
        
        arr[num] = i
        if check(num) {
            visited[i] = true
            dfs(num + 1)
            visited[i] = false
        }
    }
}


let N = Int(readLine()!)!

var arr = Array(repeating: 0, count: N) // check 용도
var visited = Array(repeating: false, count: N) // 방문 용도

var count = 0
dfs(0)
print(count)