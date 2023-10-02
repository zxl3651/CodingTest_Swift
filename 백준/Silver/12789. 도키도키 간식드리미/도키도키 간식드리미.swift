import Foundation

var N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").reversed().map{Int($0)!}
var turn = 1
var stack : [Int] = []
var answer = true
while !arr.isEmpty{
    if !stack.isEmpty{
        let num = stack.popLast()!
        if num == turn{
            turn += 1
            continue
        } else {
            stack.append(num)
        }
    }
    let tmp = arr.popLast()!
    if tmp != turn{
        stack.append(tmp)
    } else {
        turn += 1
    }
}
for _ in 0..<stack.count{
    if stack.popLast()! != turn{
        answer = false
        break
    }
    turn += 1
}

answer ? print("Nice") : print("Sad")
