let N = Int(readLine()!)!

var stack: [Int] = [Int]()
var answer = ""
var value = 0

for _ in 0..<N {
    let input = Int(readLine()!)!
    
    if let last = stack.last, input < last {
        answer = "NO"
        break
    }
    
    if (input > value) {
        while (input > value) {
            stack.append(value + 1)
            value += 1
            answer += "+\n"
        }
    }
    
    if (input == stack.popLast()!) {
        answer += "-\n"
    } else {
        answer = "NO"
        break
    }
}

print(answer)