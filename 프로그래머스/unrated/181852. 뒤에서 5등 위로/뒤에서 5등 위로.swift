import Foundation

func solution(_ num_list:[Int]) -> [Int] {
    var answer : [Int] = []
    var arr = num_list
    arr.sort()
    for i in 5..<arr.count{
        answer.append(arr[i])
    }
    return answer
}