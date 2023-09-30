import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (N,M) = (input[0], input[1])
var arr : [String] = []
var dict : [String: Int] = [:]
var answer = ""

for i in 0..<N{
    let poketmon = readLine()!
    arr.append(poketmon)
    dict[poketmon] = i+1
}
for _ in 0..<M{
    let find = readLine()!
    if let number = Int(find){
        answer += "\(arr[number-1])\n"
    } else {
        answer += "\(dict[find]!)\n"
    }
}
print(answer)
