import Foundation

let N = Int(readLine()!)!
var answer : [String] = []

for _ in 0..<N{
    answer.append(readLine()!)
}
answer = Array(Set(answer))
answer.sort(by: { $0.count == $1.count ? $0 < $1 : $0.count < $1.count})
answer.forEach { print($0) }
