import Foundation

var T = Int(readLine()!)!
for i in 0..<T {
    var input = readLine()!.map{ String($0) }
    print(input[0], input[input.count-1], separator: "")
}
