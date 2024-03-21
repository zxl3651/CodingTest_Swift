import Foundation

func solution(_ n:Int) -> Int {
    for i in 1..<1000000 {
        if i * i == n {
            return 1
        }
    }
    return 2
}