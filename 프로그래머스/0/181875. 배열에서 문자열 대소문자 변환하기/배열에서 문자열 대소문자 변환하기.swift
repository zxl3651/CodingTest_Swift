import Foundation

func solution(_ strArr:[String]) -> [String] {
    var answer: [String] = []
    for i in 0..<strArr.count {
        if i % 2 == 0 {
            answer.append(strArr[i].lowercased())
        } else {
            answer.append(strArr[i].uppercased())
        }
    }
    return answer
}