import Foundation

func solution(_ strlist:[String]) -> [Int] {
    var result : [Int] = []
    strlist.forEach{result.append($0.count)}
    return result
}