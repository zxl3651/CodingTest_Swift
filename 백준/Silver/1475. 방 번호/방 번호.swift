import Foundation

var N = readLine()!.map{ String($0) }

let arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
var flag = false

var answer: [Int] = [Int]()
var diff: [Int] = [Int]()

for i in 0...9 {
    if i == 6 || i == 9 {
        diff.append(N.reduce(0, { partialResult, ch in
            partialResult + (ch == String(i) ? 1 : 0)
        }))
    } else {
        answer.append(N.reduce(0) { partialResult, ch in
            partialResult + (ch == String(i) ? 1 : 0)
        })
    }
}

print(max(answer.max() ?? 1, Int(ceil(Double(diff.reduce(0, +)) / 2.0))))
