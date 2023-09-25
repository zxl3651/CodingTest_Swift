import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var matrix1 = Array(repeating: Array(repeating: 0, count: input[1]), count: input[0])
var matrix2 = Array(repeating: Array(repeating: 0, count: input[1]), count: input[0])
var answer = Array(repeating: Array(repeating: 0, count: input[1]), count: input[0])

for i in 0..<matrix1.count{
    matrix1[i] = readLine()!.split(separator: " ").map{ Int($0)! }
}
for i in 0..<matrix2.count{
    matrix2[i] = readLine()!.split(separator: " ").map{ Int($0)! }
}
for i in 0..<matrix1.count{
    for j in 0..<matrix1[i].count{
        answer[i][j] = matrix1[i][j] + matrix2[i][j]
    }
}
for i in answer{
    for j in i{
        print(j, terminator: " ")
    }
    print()
}
