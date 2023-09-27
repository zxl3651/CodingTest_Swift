import Foundation

let num = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = num[0]; let M = num[1]
let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

var max = -1
for i in 0..<N{
    for j in i+1..<N{
        for k in j+1..<N{
            let number = arr[i] + arr[j] + arr[k]
            if number > max && number <= M{
                max = number
            }
        }
    }
}
print(max)
