import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var sum = 0
    var bud = budget
    for i in d.sorted(){
        if bud >= i{
            sum += 1
            bud -= i
        } else {
            break
        }
    }
    return sum
}