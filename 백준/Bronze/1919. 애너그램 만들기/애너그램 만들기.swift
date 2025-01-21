import Foundation

var str1 = readLine()!.map{String($0)}
var str2 = readLine()!.map{String($0)}

var diff1 = [Int](repeating: 0, count: 26)
var diff2 = [Int](repeating: 0, count: 26)
var count = 0
for i in 97...122 {
    let ch = String(UnicodeScalar(i)!)
    diff1[count] = str1.filter({$0 == ch}).count
    diff2[count] = str2.filter({$0 == ch}).count
    
    count += 1
}

var answer = 0

for i in 0..<26 {
    answer += abs(diff1[i] - diff2[i])
}

print(answer)