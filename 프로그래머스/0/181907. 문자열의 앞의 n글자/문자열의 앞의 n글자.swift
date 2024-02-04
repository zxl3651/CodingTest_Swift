import Foundation

func solution(_ my_string:String, _ n:Int) -> String {
    var str = Array(my_string).map{ String($0) }
    var answer = ""
    for i in 0..<n{
        answer += str[i]
    }
    return answer
}