import Foundation

func solution(_ money:Int) -> [Int] {
    var answer = [Int](repeating: 0, count: 2)
    if money >= 5500 {
        answer[0] = (money / 5500)
    }
    answer[1] = money % 5500
    return answer
}