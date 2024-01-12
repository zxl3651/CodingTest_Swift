import Foundation

func solution(_ numbers:[Int], _ n:Int) -> Int {
    var answer = 0
    for i in numbers{
        answer += i
        if answer > n{
            break
        }
    }
    return answer
}