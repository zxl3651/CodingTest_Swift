import Foundation

let input = readLine()!
var arr = Array(repeating: 0, count: 26)

for c in input{
    arr[Int(c.asciiValue!) - 97] += 1
}
arr.forEach {
    print($0, terminator: " ")
}
