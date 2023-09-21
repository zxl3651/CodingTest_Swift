import Foundation

let arr = readLine()!.split(separator: " ").map({ num in
    Int(String(num))!
})
let N = arr[0], M = arr[1]

var answer = Array(1...N)

for _ in 0..<M{
    let number = readLine()!.split(separator: " ").map{ Int(String($0))! }
    (answer[number[0]-1], answer[number[1]-1]) = (answer[number[1]-1],answer[number[0]-1])
}
for i in answer{
    print(i, terminator: " ")
}
