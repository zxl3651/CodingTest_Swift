import Foundation

func solution(_ my_string:String, _ index_list:[Int]) -> String {
    var answer = ""
    var str = Array(my_string)
    for i in index_list {
        answer += "\(str[i])"
    }
    return answer
}