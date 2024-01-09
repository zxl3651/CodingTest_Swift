import Foundation

func solution(_ arr:[Int]) -> [Int] {
    var answer = [Int]()
    for i in arr{
        if i >= 50 && i % 2 == 0{
            answer.append(i / 2)
        } else if i < 50 && i % 2 == 1{
            answer.append(i * 2)
        } else {
            answer.append(i)
        }
    }
    return answer
}