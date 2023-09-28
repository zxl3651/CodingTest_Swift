import Foundation

let N = Int(readLine()!)!
var arr : [(Int, Int)] = []

for _ in 0..<N{
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    arr.append((input[0], input[1]))
}
arr.sort(by: {$0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1} )

for (num1, num2) in arr{
    print(num1, num2)
}
