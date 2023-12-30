import Foundation

var input = readLine()!.split(separator: "-")
var result = [Int](repeating: 0, count: input.count)

for i in 0..<input.count{
    if input[i].contains("+") {
        let tmp = input[i].split(separator: "+")
        var sum = 0
        for j in 0..<tmp.count{
            sum += Int(tmp[j])!
        }
        result[i] = sum
    } else {
        result[i] = Int(input[i])!
    }
}

var answer = result[0]
for i in 1..<result.count{
    answer -= result[i]
}

print(answer)