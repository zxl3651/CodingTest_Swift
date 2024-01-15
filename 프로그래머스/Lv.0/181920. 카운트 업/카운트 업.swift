import Foundation

func solution(_ start_num:Int, _ end_num:Int) -> [Int] {
    var answer = [Int]()
    for i in start_num...end_num{
        answer.append(i)
    }
    return answer
}