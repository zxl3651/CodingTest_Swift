import Foundation

func solution(_ n:Int, _ k:Int) -> [Int] {
    var answer = [Int]()
    for i in 1...n{
        if i % k == 0{
            answer.append(i)
        }
    }
    return answer
}