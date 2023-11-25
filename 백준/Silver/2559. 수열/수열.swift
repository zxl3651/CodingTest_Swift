import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (N, K) = (input[0], input[1])

var arr = readLine()!.split(separator: " ").map{ Int($0)! }

for i in 1..<arr.count{
    arr[i] += arr[i-1]
}

var answer = Int.min
for i in K...N{
    if i == K {
        answer = max(answer, arr[i-1])
    } else{
        answer = max(answer, arr[i-1] - arr[i-K-1])
    }
}
print(answer)