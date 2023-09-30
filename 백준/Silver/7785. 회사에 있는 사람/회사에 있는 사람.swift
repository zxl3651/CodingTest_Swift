import Foundation

let N = Int(readLine()!)!
var arr = Set<String>()

for _ in 0..<N{
    let input = readLine()!.split(separator: " ").map{String($0)}
    if input[1] == "enter"{
        arr.insert(input[0])
    } else if input[1] == "leave"{
        arr.remove(input[0])
    }
}
var answer = ""
arr.sorted(by: >).forEach{ answer += "\($0)\n"}
print(answer)
