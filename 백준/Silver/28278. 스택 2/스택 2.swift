import Foundation

let N = Int(readLine()!)!
var stack : [Int] = []
for _ in 0..<N{
    let command = readLine()!.split(separator: " ").map{ Int($0)! }
    if command[0] == 1{
        stack.append(command[1])
    } else if command[0] == 2{
        if stack.isEmpty{
            print(-1)
        } else {
            print(stack.popLast()!)
        }
    } else if command[0] == 3{
        print(stack.count)
    } else if command[0] == 4{
        if stack.isEmpty{
            print(1)
        } else {
            print(0)
        }
    } else if command[0] == 5{
        if stack.isEmpty{
            print(-1)
        } else {
            print(stack.last!)
        }
    }
}
