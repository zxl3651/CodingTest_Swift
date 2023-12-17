import Foundation

func solution(_ my_string:String, _ n:Int) -> String {
    var answer = ""
    for i in my_string{
        answer += String(repeating:i, count: n)
    }
    return answer
}