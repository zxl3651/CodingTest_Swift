import Foundation

func solution(_ A:String, _ B:String) -> Int {
    var answer = -1
    var str = Array(A)
    for _ in 0..<str.count{
        answer += 1
        if String(str) == B {
            return answer
        }
        str.insert(str.popLast()!, at: 0)
    }
    return -1
}