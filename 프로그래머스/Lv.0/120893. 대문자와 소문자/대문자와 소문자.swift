import Foundation

func solution(_ my_string:String) -> String {
    var answer = ""
    for i in my_string{
        if i.asciiValue ?? 0 > 64 && i.asciiValue ?? 0 < 91{
            answer += i.lowercased()
        } else {
            answer += i.uppercased()
        }
    }
    return answer
}