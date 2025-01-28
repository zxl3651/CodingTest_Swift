let N = Int(readLine()!)!

for _ in 0..<N {
    var leftStack: [String] = [String]()
    var rightStack: [String] = [String]()
    
    let input = Array(readLine()!.map{String($0)})
 
    for str in input {
        if (str == "<") {
            if (leftStack.count == 0) {
                continue
            }
            rightStack.append(leftStack.removeLast())
        } else if (str == ">") {
            if (rightStack.count == 0) {
                continue
            }
            leftStack.append(rightStack.removeLast())
        } else if (str == "-") {
            if (leftStack.count == 0) {
                continue
            }
            leftStack.removeLast()
        }
        else {
            leftStack.append(str)
        }
    }
    
    print((leftStack + rightStack.reversed()).joined())
}