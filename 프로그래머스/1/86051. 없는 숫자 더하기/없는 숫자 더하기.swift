import Foundation

func solution(_ numbers:[Int]) -> Int {
    var answer = 0
    for i in 1..<10{
        if !numbers.contains(i){
            answer += i
        }
    }
    return answer
}