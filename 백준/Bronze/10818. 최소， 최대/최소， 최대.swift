import Foundation

let N = Int(readLine()!)!
var arr : [Int] = readLine()!.split(separator: " ").map({ num in
    Int(String(num))!
})
print(arr.min()!, arr.max()!)
