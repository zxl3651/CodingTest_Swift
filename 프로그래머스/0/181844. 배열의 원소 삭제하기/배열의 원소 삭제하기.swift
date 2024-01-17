import Foundation

func solution(_ arr:[Int], _ delete_list:[Int]) -> [Int] {
    var answer = [Int]()
    for i in arr{
        if !delete_list.contains(i){
            answer.append(i)
        }
    }
    return answer
}