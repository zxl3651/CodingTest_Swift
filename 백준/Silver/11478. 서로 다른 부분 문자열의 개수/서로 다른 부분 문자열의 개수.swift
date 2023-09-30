import Foundation

let S = Array(readLine()!).map{String($0)}
var answer = Set<String>()

for i in 0..<S.count{
    var word = ""
    for j in i..<S.count{
        word += S[j]
        answer.insert(word)
    }
}
print(answer.count)
