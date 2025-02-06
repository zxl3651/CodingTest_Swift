var N = Int(readLine()!)!
var tower = [Int](repeating: 0, count: N)

for i in 0..<N {
    tower[i] = Int(readLine()!)!
}

var stack = [Int]() // 가장 작은 빌딩들을 빼면서 진행
var answer = 0

for i in 0..<N {
    while !stack.isEmpty && tower[i] >= stack.last! {
        stack.removeLast()
    }
    stack.append(tower[i])
    answer += stack.count - 1
}

print(answer)
