import Foundation

let N = Int(readLine()!)!
var stack : [Int] = []

var answer = ""
for _ in 0..<N{
    let input = readLine()!
    if input == "pop"{
        answer += "\(stack.isEmpty ? -1 : stack.popLast()!)\n"
    } else if input == "size" {
        answer += "\(stack.count)\n"
    } else if input == "empty" {
        answer += "\(stack.isEmpty ? 1 : 0)\n"
    } else if input == "top" {
        answer += "\(stack.isEmpty ? -1 : stack[stack.count-1])\n"
    } else {
        stack.append(Int(input.split(separator: " ").last!)!)
    }
}
print(answer)
