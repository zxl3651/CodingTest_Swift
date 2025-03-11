var answer = 0
var stick = 0
var input = readLine()!.map{String($0)}
var stack = [String]()
var isLaser = true
for i in 0..<input.count {
    if stack.isEmpty {
        stick += 1
        stack.append(input[i])
        isLaser = true
        continue
    }
    if stack.last! != input[i] {
        stick -= 1
        if isLaser { // 레이저로 잘랐다는 뜻
            answer += stick
            isLaser = false // 다음엔 막대 끝이라는 걸 표시
            continue
        }
        answer += 1 // 막대가 끝이므로 1 더해줌
        _ = stack.popLast()
    } else if stack.last! == input[i] {
        isLaser = true // 다음엔 레이저라는 걸 표시
        stick += 1
        stack.append(input[i])
    }
}

print(answer)
