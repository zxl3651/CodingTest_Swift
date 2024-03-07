import Foundation

var answer = ""

let N = Int(readLine()!)!
var heap = [Int]()

for _ in 0..<N {
    let input = Int(readLine()!)!
    if input == 0 {
        if heap.isEmpty {
            answer += "0\n"
        } else { // 큰 값이 있는경우
            var min = Int.max, minIndex = 0
            for i in 0..<heap.count {
                if min > heap[i] {
                    min = heap[i]
                    minIndex = i
                }
            }
            if min == Int.max {
                answer += "0\n"
                continue
            }
            heap[minIndex] = Int.max
            answer += "\(min)\n"
        }
    } else { // 다른 숫자가 들어오는 경우
        heap.append(input)
    }
}

print(answer)