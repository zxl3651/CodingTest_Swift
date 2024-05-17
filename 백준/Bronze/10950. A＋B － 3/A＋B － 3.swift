import Foundation

var T = Int(readLine()!)!
for i in 0..<T {
    var input = readLine()!.split(separator: " ").map{ Int($0)! }
    print(input[0] + input[1])
}