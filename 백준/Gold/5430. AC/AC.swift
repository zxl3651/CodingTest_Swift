import Foundation

var T = Int(readLine()!)!
var answer = ""

for _ in 0..<T {
    let p = readLine()!.map{String($0)}
    var end = Int(readLine()!)!
    var arr = readLine()!.filter { $0.isNumber || $0 == "," }
        .split { $0 == "," }
        .map { String($0) }
    
    var result = ""
    var front = 0
    var isReversed = false
    
    for i in 0..<p.count {
        if p[i] == "R" { // 배열 뒤집기
            isReversed.toggle()
            continue
        } else if p[i] == "D" {
            if isReversed {
                end -= 1
            } else {
                front += 1
            }
            if front > end {
                result = "error"
                break
            }
        }
    }
    
    if result == "error" {
        answer += "\(result)\n"
    } else {
        if isReversed {
            answer += "[\(Array(arr[front..<end]).reversed().joined(separator: ","))]\n"
        } else {
            answer += "[\(Array(arr[front..<end]).joined(separator: ","))]\n"
        }
    }
}
print("\(answer)")
