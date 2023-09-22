import Foundation

let numbers = readLine()!.split(separator: " ")
var answer : [Int] = []
for i in numbers{
    answer.append((Int(String(i.reversed()))!)) // i도 String이므로 reversed()를 사용할 수 있다.
}
print(answer[0] > answer[1] ? answer[0] : answer[1])