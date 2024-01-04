import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n,m) = (input[0], input[1])

var arr : [[Int]] = [[Int](repeating: 0, count: n + 1)]

for i in 0..<n{
    arr.append([0] + readLine()!.split(separator: " ").map{ Int($0)! })
}

for y in 1...n{
    for x in 1...n{
        arr[y][x] += arr[y-1][x] + arr[y][x-1] - arr[y-1][x-1]
    }
}

for _ in 0..<input[1]{
    input = readLine()!.split(separator: " ").map{ Int($0)! }
    let (y1, x1, y2, x2) = (input[0], input[1], input[2], input[3])
    print(arr[y2][x2] - arr[y1 - 1][x2] - arr[y2][x1 - 1] + arr[y1 - 1][x1 - 1])
}
