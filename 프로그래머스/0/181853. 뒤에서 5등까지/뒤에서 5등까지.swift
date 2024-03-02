import Foundation

func solution(_ num_list:[Int]) -> [Int] {
    var answer = [Int]()
    var tmp = num_list.sorted()
    for i in 0..<5 {
        answer.append(tmp[i])
    }
    return answer
}