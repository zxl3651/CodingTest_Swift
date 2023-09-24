import Foundation

let alpha = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
var input = readLine()!
for c in alpha{
    input = input.replacingOccurrences(of: c, with: "a")
}
print(input.count)
