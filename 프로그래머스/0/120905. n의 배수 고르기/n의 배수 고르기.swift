import Foundation

func solution(_ n:Int, _ numlist:[Int]) -> [Int] {
    var answer = [Int]()
    for i in numlist {
        if i % n == 0 {
            answer.append(i)
        }
    }
    return answer
}