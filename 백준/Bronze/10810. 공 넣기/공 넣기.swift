import Foundation

let arr = readLine()!.split(separator: " ").map({ num in
    Int(String(num))!
})
let N = arr[0], M = arr[1]

var answer = Array(repeating: 0, count: N)

for _ in 0..<M{
    let range = readLine()!.split(separator: " ").map { num in
        Int(String(num))!
    }
    for i in range[0]...range[1]{
        answer[i-1] = range[2]
    }
}
for i in 0..<answer.count{
    print(answer[i], terminator: " ")
}
