import Foundation

let s1 = readLine()!
var answer = ""
s1.forEach {
    if $0.isLowercase {
        answer += "\($0.uppercased())"
    } else {
        answer += "\($0.lowercased())"
    }
}
print(answer)