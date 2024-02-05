import Foundation

func divideAndConquer(y: Int, x: Int, n: Int) {
    var white = 0
    var blue = 0
    for y in y..<y + n {
        for x in x..<x + n {
            if arr[y][x] == 0 {
                white += 1
            } else {
                blue += 1
            }
        }
    }
    
    if white == n * n {
        whiteCount += 1
        return
    }
    
    if blue == n * n {
        blueCount += 1
        return
    }
    divideAndConquer(y: y, x: x, n: n / 2)
    divideAndConquer(y: y, x: x + n / 2, n: n / 2)
    divideAndConquer(y: y + n / 2, x: x, n: n / 2)
    divideAndConquer(y: y + n / 2, x: x + n / 2, n: n / 2)
}

let n = Int(readLine()!)!

var arr = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

for i in 0..<n{
    arr[i] = readLine()!.split(separator: " ").map{ Int($0)! }
}

var whiteCount = 0
var blueCount = 0

divideAndConquer(y: 0, x: 0, n: n)
print(whiteCount)
print(blueCount)