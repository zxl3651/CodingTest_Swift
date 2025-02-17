let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1]
var targets = readLine()!.split(separator: " ").map { Int($0)! }
var queue = Array(1...N)
var answer = 0

while !targets.isEmpty {
    if queue.first! == targets.first! {
        queue.removeFirst()
        targets.removeFirst()
        continue
    }
    
    let firstIndex = queue.firstIndex(of: targets.first!)!
    let lastIndex = queue.count - queue.firstIndex(of: targets.first!)!
    
    if firstIndex < lastIndex {
        queue.append(queue.removeFirst())
    } else {
        queue.insert(queue.popLast()!, at: 0)
    }
    answer += 1
}

print(answer)