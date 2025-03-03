var answer = 0
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.map{String($0)}
    var stack = [String]()
    for i in 0..<input.count {
        if stack.isEmpty {
            stack.append(input[i])
            continue
        }
        if stack.last! != input[i] {
            stack.append(input[i])
        } else if stack.last! == input[i] {
            _ = stack.popLast()
        }
    }
    
    if stack.isEmpty {
        answer += 1
    }
}

print(answer)