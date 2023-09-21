import Foundation

let A = readLine()!.split(separator: " ").map{ Int(String($0))! }
print("\(A[0] + A[1])")
