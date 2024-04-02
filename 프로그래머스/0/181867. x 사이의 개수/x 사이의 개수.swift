import Foundation

func solution(_ myString:String) -> [Int] {
    var answer = [Int]()
    var cnt = 0
    for c in myString {
        if c == "x" {
            answer.append(cnt)
            cnt = 0
        } else {
            cnt += 1
        }
    }
    answer.append(cnt)
    return answer
}