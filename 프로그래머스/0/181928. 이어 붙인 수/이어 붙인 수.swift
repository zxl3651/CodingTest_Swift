import Foundation

func solution(_ num_list:[Int]) -> Int {
    var even = ""
    var odd = ""
    for i in num_list{
        if i % 2 == 0{
            even += "\(i)"
        } else {
            odd += "\(i)"
        }
    }
    return Int(even)! + Int(odd)!
}