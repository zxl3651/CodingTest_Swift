import Foundation

let num = Int(readLine()!)!
var grade = readLine()!.split(separator: " ").map { num in
    Float(String(num))!
}

let M = grade.max()!

for i in 0..<grade.count{
    grade[i] = Float(grade[i] / M) * 100.0
}
print(grade.reduce(0.0, +) / Float(grade.count))
