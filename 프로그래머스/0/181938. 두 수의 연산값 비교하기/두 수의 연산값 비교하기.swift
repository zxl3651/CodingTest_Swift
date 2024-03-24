import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    let answer = Int("\(a)\(b)")!
    return answer < 2 * a * b ? 2 * a * b : answer
}