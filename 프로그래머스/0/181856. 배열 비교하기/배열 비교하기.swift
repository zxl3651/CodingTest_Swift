import Foundation

func solution(_ arr1:[Int], _ arr2:[Int]) -> Int {
    var answer = 0
    if arr1.count > arr2.count {
        answer = 1
    } else if arr1.count < arr2.count {
        answer = -1
    } else {
        var num1 = arr1.reduce(0, +)
        var num2 = arr2.reduce(0, +)
        if num1 > num2 {
            answer = 1
        } else if num2 > num1 {
            answer = -1
        }
    }
    return answer
}