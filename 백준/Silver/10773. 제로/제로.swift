import Foundation

let N = Int(readLine()!)!
var stack : [Int] = []
for _ in 0..<N{
    let input = Int(readLine()!)!
    if input == 0{
        stack.removeLast()
    } else {
        stack.append(input)
    }
}
print(stack.reduce(0, +))
