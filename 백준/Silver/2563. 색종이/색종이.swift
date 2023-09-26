import Foundation

let num = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: false, count: 100), count: 100)
for _ in 0..<num{
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    for i in input[0]..<input[0]+10{
        for j in input[1]..<input[1]+10{
            arr[i][j] = true
        }
    }
}
var cnt = 0
for i in 0..<100{
    for j in 0..<100{
        if arr[i][j]{
            cnt += 1
        }
    }
}

print(cnt)
