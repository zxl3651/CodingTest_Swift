import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let str = String(n, radix: k).map{ String($0) }
    var arr = str.split(separator: "0").map{ $0.joined() }
    var answer = 0
    for i in arr {
        var flag = true
        if Int(i)! < 2 {
            continue
        }
        for j in 2..<Int(sqrt(Double(Int(i)!)) + 1){
            if Int(i)! % j == 0{
                flag = false
            }
        }
        if flag {
            answer += 1
        }
    }
    return answer
}