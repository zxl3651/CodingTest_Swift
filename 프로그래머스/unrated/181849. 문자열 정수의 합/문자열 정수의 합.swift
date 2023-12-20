import Foundation

func solution(_ num_str:String) -> Int {
    var answer = 0
    for i in num_str{
        answer += Int(String(i))!
    }
    return answer
}