import Foundation

let n = Int(readLine()!)!

var arr = [(Int, Int)]()

for _ in 0..<n{
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    arr.append((input[0], input[1]))
}

arr = arr.sorted{
    $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1
}

var count = 0
var start = 0

for i in 0..<n{
    if i == 0{
        start = arr[i].1
        count += 1
    } else {
        if arr[i].0 >= start {
            start = arr[i].1
            count += 1
        }
    }
}

print(count)