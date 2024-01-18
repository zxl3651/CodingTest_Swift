import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [Int] {
    var answer = [Int]()
    for i in n-1..<num_list.count{
        answer.append(num_list[i])
    }
    return answer
}