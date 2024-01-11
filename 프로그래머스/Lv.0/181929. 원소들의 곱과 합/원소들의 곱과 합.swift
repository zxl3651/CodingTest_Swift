import Foundation

func solution(_ num_list:[Int]) -> Int {
    var num1 = num_list[0]
    var num2 = num_list[0]
    for i in 1..<num_list.count{
        num1 += num_list[i]
        num2 *= num_list[i]
    }
    
    return num1 * num1 > num2 ? 1 : 0
}