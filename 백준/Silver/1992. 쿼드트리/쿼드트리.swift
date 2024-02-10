import Foundation

func divideAndConquer(y: Int, x: Int, n: Int) {
    var white = 0
    var black = 0
    for y in y..<y + n {
        for x in x..<x + n {
            if arr[y][x] == 0 {
                white += 1
            } else {
                black += 1
            }
        }
    }
    
    if white == n * n {
        answer += "0"
        return
    } else if black == n * n {
        answer += "1"
        return
    }
    answer += "("
    divideAndConquer(y: y, x: x, n: n / 2)
    divideAndConquer(y: y, x: x + n / 2, n: n / 2)
    divideAndConquer(y: y + n / 2, x: x, n: n / 2)
    divideAndConquer(y: y + n / 2, x: x + n / 2, n: n / 2)
    answer += ")"
}

let n = Int(readLine()!)!

var arr = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

for i in 0..<n{
    arr[i] = readLine()!.map{ Int(String($0))! }
}

var answer = ""

divideAndConquer(y: 0, x: 0, n: n)
print(answer)
