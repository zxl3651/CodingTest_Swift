import Foundation

func solution(_ n:Int) -> Int {
    var answer = 0
    if n % 2 == 0 {
        for i in 1...n {
            if i % 2 == 0 {
                answer += (i * i)
            }
        }
    } else {
        for i in 1...n {
            if i % 2 != 0 {
                answer += i
            }
        }
    }
    return answer

}