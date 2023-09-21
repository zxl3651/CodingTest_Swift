import Foundation

var answer : [Int] = []


for _ in 0..<10{
    answer.append(Int(readLine()!)! % 42)
}

print(Set(answer).count)
