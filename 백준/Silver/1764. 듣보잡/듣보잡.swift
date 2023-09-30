import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (N,M) = (input[0], input[1])

var listen = Set<String>()
var look = Set<String>()
var answer : [String] = []

for _ in 0..<N{
    listen.insert(readLine()!)
}
for _ in 0..<M{
    look.insert(readLine()!)
}

for i in listen{
    if look.remove(i) != nil{
        answer.append(i)
    }
}
print(answer.count)
answer.sorted(by: <).forEach{ print($0) }
