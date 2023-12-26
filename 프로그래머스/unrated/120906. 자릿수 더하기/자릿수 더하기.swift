import Foundation

func solution(_ n:Int) -> Int {
    var answer = 0
    String(n).forEach{
        answer += Int(String($0))!
    }
    return answer
}