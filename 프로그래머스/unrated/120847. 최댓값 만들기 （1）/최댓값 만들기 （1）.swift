import Foundation

func solution(_ numbers:[Int]) -> Int {
    var arr = numbers.sorted(by: >)
    return arr[0] * arr[1]
}