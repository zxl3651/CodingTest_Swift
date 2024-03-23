import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var k = k
    var arr = number.map{ String($0) }
    var stack = [String]()
    
    
    for i in arr {
        while let last = stack.last, last < i, k > 0 {
            k -= 1
            stack.removeLast()
        }
        stack.append(i)
    }
    
    if k != 0 {
        stack.removeLast(k)
    }
    
    return stack.joined()
}