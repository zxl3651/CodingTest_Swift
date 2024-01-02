import Foundation

let n = Int(readLine()!)!
let length = readLine()!.split(separator: " ").map{ Int($0)! }
let oil = readLine()!.split(separator: " ").map{ Int($0)! }

var curoil = oil[0]
var answer = 0
for i in 1...length.count{
    if curoil > oil[i]{
        answer += length[i-1] * curoil
        curoil = oil[i]
    } else{
        answer += length[i-1] * curoil
    }
}

print(answer)