import Foundation

var s = Array(readLine()!)
let q = Int(readLine()!)!

for _ in 0..<q{
    let input = readLine()!.split(separator: " ")
    let str = s[Int(input[1])!...Int(input[2])!]
    print(str.reduce(0, {
        String($1) == String(input[0]) ? $0 + 1 : $0
    }))
}