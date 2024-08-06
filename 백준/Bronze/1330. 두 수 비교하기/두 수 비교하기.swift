import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
if input[0] == input[1] {
    print("==")
} else {
    print(input[0] > input[1] ? ">" : "<")
}

