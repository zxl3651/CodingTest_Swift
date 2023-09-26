import Foundation

var arr = Array(repeating: Array(repeating: "", count: 15), count: 5)
for i in 0..<5{
    let word = readLine()!.map{ String($0) }
    let lastIndex = word.count - 1
    arr[i].replaceSubrange(0..<lastIndex, with: word)
}
var result = ""
for i in 0..<15{
    for j in 0..<5{
        if arr[j][i] != "-"{
            result += arr[j][i]
        }
    }
}
print(result)
