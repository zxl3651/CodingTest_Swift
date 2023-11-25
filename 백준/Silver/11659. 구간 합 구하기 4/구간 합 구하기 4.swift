import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (N, M) = (input[0], input[1])

var arr = readLine()!.split(separator: " ").map{Int($0)!}

for i in 1..<arr.count{
    arr[i] = arr[i] + arr[i-1]
}
for _ in 0..<M{
    let range = readLine()!.split(separator: " ").map{ Int($0)! }
    var (i, j) = (range[0]-1, range[1]-1)
    if i == 0{
        print(arr[j])
    } else {
        print(arr[j] - arr[i-1])
    }
}