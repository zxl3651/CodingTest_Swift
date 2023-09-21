import Foundation

let n = Int(readLine()!)!
let arr = Array(readLine()!).map{ Int(String($0))! }
print(arr.reduce(0, +))

