import Foundation

let N = Int(readLine()!)!
for _ in 0..<N{
    var stack : [Character] = []
    var flag = false
    let input = Array(readLine()!)
    
    for i in 0..<input.count{
        if input[i] == ")"{
            if stack.popLast() != "("{
                flag.toggle()
                break
            }
        } else {
            stack.append(input[i])
        }
    }
    
    if flag || !stack.isEmpty {
        print("NO")
    } else {
        print("YES")
    }
}
