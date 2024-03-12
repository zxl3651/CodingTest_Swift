import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }

let (n, m, r) = (input[0], input[1], input[2])

var arr = [[Int]]()
for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

// 돌리는 로직
// min(n, m) / 2 번 돌며 1차원 배열로 전환
// r % (2 * n + m) 번 회전 시킨다음(각 배열마다)
// tmp 배열에 합치기
for i in 0..<min(n,m) / 2 {
    var result = [Int]()
    let maxN = n - i - 1 // 세로 길이
    let maxM = m - i - 1 // 가로 길이
    for j in i..<maxM {
        result.append(arr[i][j])
    }
    
    for j in i..<maxN {
        result.append(arr[j][maxM])
    }
    
    for j in stride(from: maxM, to: i, by: -1) {
        result.append(arr[maxN][j])
    }
    
    for j in stride(from: maxN, to: i, by: -1) {
        result.append(arr[j][i])
    }
    
    let div = r % result.count
    result = Array(result[div..<result.count] + result[0..<div])
    var index = 0
    
    for j in i..<maxM {
        arr[i][j] = result[index]
        index += 1
    }
    
    for j in i..<maxN {
        arr[j][maxM] = result[index]
        index += 1
    }
    
    for j in stride(from: maxM, to: i, by: -1) {
        arr[maxN][j] = result[index]
        index += 1
    }
    
    for j in stride(from: maxN, to: i, by: -1) {
        arr[j][i] = result[index]
        index += 1
    }
}

for i in 0..<n {
    print(arr[i].map{String($0)}.joined(separator: " "))
}
