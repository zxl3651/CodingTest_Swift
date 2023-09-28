import Foundation

let N = Int(readLine()!)!
var answer : [(Int, String, Int)] = []

for i in 0..<N{
    let input = readLine()!.split(separator: " ").map{ String($0) }
    answer.append((Int(input[0])!, input[1], i))
}

answer.sort(by: { $0.0 == $1.0 ? $0.2 < $1.2 : $0.0 < $1.0 })
answer.forEach{ print($0.0, $0.1) }
