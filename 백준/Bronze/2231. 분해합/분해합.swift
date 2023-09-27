import Foundation

let N = Int(readLine()!)!
var answer = 0
for i in 1..<N{
    let digit = Array(String(i)).map{ Int(String($0))! }
    if i + digit.reduce(0, +) == N{
        answer = i
        break
    }
}
print(answer)
