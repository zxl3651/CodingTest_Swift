var N = Int(readLine()!)!
var tower = readLine()!.split(separator: " ").map{Int($0)!}

var stack = [Int]()
var answer = [Int]()

for idx in 0..<tower.count {
    while !stack.isEmpty && tower[stack.last!] < tower[idx] {
        stack.removeLast()
    }
    if let top = stack.last {
        answer.append(top + 1)
    } else {
        answer.append(0)
    }
    stack.append(idx)
}

print(answer.map{String($0)}.joined(separator: " "))
