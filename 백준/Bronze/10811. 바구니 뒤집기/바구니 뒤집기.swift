import Foundation

let arr = readLine()!.split(separator: " ").map { num in
    Int(String(num))!
}

let N = arr[0], M = arr[1]

var answer = Array(1...N)

for _ in 0..<M{
    var num = readLine()!.split(separator: " ").map { num in
        Int(String(num))!
    }
    while (num[0] < num[1]){
        answer.swapAt(num[0]-1, num[1]-1)
        num[0] += 1
        num[1] -= 1
    }
}
for i in answer{
    print(i, terminator: " ")
}
