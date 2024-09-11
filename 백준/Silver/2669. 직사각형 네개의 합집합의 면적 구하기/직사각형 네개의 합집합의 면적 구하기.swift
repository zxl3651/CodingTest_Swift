import Foundation

var flag = [[Bool]](repeating: [Bool](repeating: false, count: 100), count: 100)

for i in 0..<4 {
    drawRectangle(readLine()!.split(separator: " ").map{ Int($0)! })
}

func drawRectangle(_ rec: [Int]) {
    for y in rec[1]..<rec[3] {
        for x in rec[0]..<rec[2] {
            if !flag[y][x] {
                flag[y][x].toggle()
            }
        }
    }
}

print(flag.flatMap{ $0 }.filter {$0}.count )