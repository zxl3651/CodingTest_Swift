import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var dict : [Int:Double] = [:]
    var total : Double = Double(stages.count)
    var fail : [Int] = Array(repeating: 0, count: N+2)
    var count = 0
    for i in stages {
        fail[i] += 1
    }
    
    for i in 1..<N+1{
        if fail[i] == 0{
            dict[i] = 0.0
        } else {
            dict[i] = Double(fail[i]) / total
            total = total - Double(fail[i])
        }
    }
    
    return dict.sorted{ $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value }.map{ $0.key }
}