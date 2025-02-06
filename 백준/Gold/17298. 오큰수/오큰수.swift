var N = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map{Int($0)!}

var stack = [Int]() // 인덱스 집어넣기
var answer = [Int](repeating: 0, count: N)

for i in 0..<N {
    while !stack.isEmpty && numbers[i] > numbers[stack.last!] {
        answer[stack.last!] = numbers[i] // stack.last 인덱스의 오큰수는 numbers[i]!
        stack.removeLast()
    }
    
    stack.append(i)
}
answer = answer.map{ $0 == 0 ? -1 : $0}

print(answer.map{String($0)}.joined(separator: " "))
