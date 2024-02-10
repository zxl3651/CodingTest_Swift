import Foundation

func divideAndConquer(y: Int, x: Int, n: Int) {
    var tmp1 = 0
    var tmp2 = 0
    var tmp3 = 0
    
    for y in y..<y + n {
        for x in x..<x + n {
            if arr[y][x] == -1 {
                tmp1 += 1
            } else if arr[y][x] == 0 {
                tmp2 += 1
            } else {
                tmp3 += 1
            }
        }
    }
    
    if tmp1 == n * n {
        paper1 += 1
        return
    } else if tmp2 == n * n {
        paper2 += 1
        return
    } else if tmp3 == n * n {
        paper3 += 1
        return
    }
    
    for i in 0..<3 {
        let num = n / 3
        divideAndConquer(y: y + num * i, x: x, n: num)
        divideAndConquer(y: y + num * i, x: x + num, n: num)
        divideAndConquer(y: y + num * i, x: x + num * 2, n: num)
    }
    
}

let n = Int(readLine()!)!

var arr = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

for i in 0..<n{
    arr[i] = readLine()!.split(separator: " ").map{ Int($0)! }
}

var paper1 = 0
var paper2 = 0
var paper3 = 0

divideAndConquer(y: 0, x: 0, n: n)
print(paper1)
print(paper2)
print(paper3)