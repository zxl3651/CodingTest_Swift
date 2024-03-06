import Foundation

var answer = ""

let N = Int(readLine()!)!
var queue = [Int]()
var index = 0

for _ in 0..<N {
    let input = Int(readLine()!)!
    if input == 0 {
        if queue.isEmpty {
            answer += "0\n"
        } else { // 큰 값이 있는경우
            var max = 0, maxIndex = 0
            for i in 0..<queue.count {
                if max < queue[i] {
                    max = queue[i]
                    maxIndex = i
                }
            }
            queue[maxIndex] = 0
            answer += "\(max)\n"
        }
    } else { // 다른 숫자가 들어오는 경우
        queue.append(input)
    }
}

print(answer)