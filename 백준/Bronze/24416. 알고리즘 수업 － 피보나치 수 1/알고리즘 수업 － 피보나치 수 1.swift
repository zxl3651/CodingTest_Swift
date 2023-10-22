import Foundation

func fibonacci(num : Int) -> Int {
    for i in stride(from: 3, through: num, by: 1){
        cnt2 += 1
        arr.append(arr[i-1] + arr[i-2])
    }
    return arr[num]
}

let N = Int(readLine()!)!
var cnt1 = 0
var cnt2 = 0
var arr : [Int] = [0,1,1]
fibonacci(num: N)
print("\(arr[N]) \(N-2)")