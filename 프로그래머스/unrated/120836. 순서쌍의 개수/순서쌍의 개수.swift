import Foundation

func solution(_ n:Int) -> Int {
    var answer = 0
    for i in stride(from: 1, through: n, by: 1){
        if n % i == 0{
            answer += 1
        }
    }
    return answer
}