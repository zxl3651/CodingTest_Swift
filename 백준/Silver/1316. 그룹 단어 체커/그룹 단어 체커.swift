import Foundation

let N = Int(readLine()!)!
var answer = 0
for _ in 0..<N{
    let word = readLine()!
    var list:[Character] = []
    for c in word{
        if list.isEmpty{
            list.append(c)
            continue
        }
        if list.contains(c){
            if list[list.endIndex-1] != c{
                answer -= 1
                break
            }
        } else{
            list.append(c)
        }
    }
    answer += 1
}
print(answer)
