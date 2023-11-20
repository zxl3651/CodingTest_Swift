import Foundation

var board: [[Int]] = []
for _ in 0..<9 {
    board.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var zeroCoord: [(Int, Int)] = []

for y in 0..<9 {
    for x in 0..<9 {
        if board[y][x] == 0 {
            zeroCoord.append((y, x))
        }
    }
}

func isValidRow(y: Int, num: Int) -> Bool {
    return !board[y].contains(num)
}

func isValidColumn(x: Int, num: Int) -> Bool {
    for i in 0..<9 {
        if board[i][x] == num {
            return false
        }
    }
    return true
}

func isValidRect(y: Int, x: Int, num: Int) -> Bool {
    let ny = y / 3 * 3
    let nx = x / 3 * 3
    
    for i in 0..<3 {
        for j in 0..<3 {
            if board[ny + i][nx + j] == num {
                return false
            }
        }
    }
    return true
}

func writeNumber(d: Int) {
    if d == zeroCoord.count {
        for y in 0..<9 {
            for x in 0..<9 {
                print(board[y][x], terminator: " ")
            }
            print()
        }
        exit(0)
    }
    let y = zeroCoord[d].0
    let x = zeroCoord[d].1
    for i in 1...9 {
        if isValidRow(y: y, num: i) && isValidColumn(x: x, num: i) && isValidRect(y: y, x: x, num: i) {
            board[y][x] = i
            writeNumber(d: d + 1)
            board[y][x] = 0
        }
    }
}

writeNumber(d: 0)