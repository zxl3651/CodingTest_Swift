import Foundation

struct stack {
    var arr: [Int] = [Int]()
    var count: Int { return arr.count }
    var isEmpty: Int { return arr.isEmpty ? 1 : 0 }
    var top: Int { return arr.isEmpty ? -1 : arr[arr.count - 1] }
    
    mutating func push(_ x: Int) {
        arr.append(x)
    }
    
    mutating func pop() -> Int {
        return arr.isEmpty ? -1 : arr.popLast()!
    }
}

var N = Int(readLine()!)!
var s = stack()

for i in 0..<N {
    var input = readLine()!.split(separator: " ").map{ Int($0)! }
    switch (input[0]) {
    case 1: s.push(input[1])
    case 2: print(s.pop())
    case 3: print(s.count)
    case 4: print(s.isEmpty)
    case 5: print(s.top)
    default:
        break
    }
}