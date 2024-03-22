import Foundation

func solution(_ citations:[Int]) -> Int {
    var answer = 0
    var arr = citations.sorted(by: >)
    let n = citations.count
    for i in 0..<n {
        if i + 1 <= arr[i] {
            answer = i + 1
        }
    }
    return answer
}