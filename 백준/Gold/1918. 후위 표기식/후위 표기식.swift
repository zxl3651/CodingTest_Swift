var stack : [String] = []
let input = Array(readLine()!).map{String($0)}
var flag = false
var op : [String] = []
var firstop : [[String]] = Array(repeating: Array(repeating: "", count: 1), count: 1000)
var index = -1
for i in 0..<input.count{
    if input[i] == "("{
        index += 1
        continue
    } else if input[i] == ")"{
        while !firstop[index].isEmpty{
            stack.append(firstop[index].popLast()!)
        }
        index -= 1
        continue
    }
    if index >= 0{
        if !firstop[index].isEmpty{
            if input[i] == "*"{
                while firstop[index].contains("*") || firstop[index].contains("/"){
                    stack.append(firstop[index].popLast()!)
                }
                firstop[index].append("*")
            } else if input[i] == "/"{
                while firstop[index].contains("*") || firstop[index].contains("/"){
                    stack.append(firstop[index].popLast()!)
                }
                firstop[index].append("/")
            } else if input[i] == "+"{
                while !firstop[index].isEmpty{
                    stack.append(firstop[index].popLast()!)
                }
                firstop[index].append("+")
            } else if input[i] == "-"{
                while !firstop[index].isEmpty{
                    stack.append(firstop[index].popLast()!)
                }
                firstop[index].append("-")
            } else {
                stack.append(input[i])
            }
            continue
        }
        else if input[i] == "+"{
            firstop[index].append("+")
        } else if input[i] == "-"{
            firstop[index].append("-")
        } else if input[i] == "*"{
            firstop[index].append("*")
        } else if input[i] == "/"{
            firstop[index].append("/")
        } else {
            stack.append(input[i])
        }
    }
    else if !op.isEmpty{
        if input[i] == "*"{
            while op.contains("*") || op.contains("/"){
                stack.append(op.popLast()!)
            }
            op.append("*")
        } else if input[i] == "/"{
            while op.contains("*") || op.contains("/"){
                stack.append(op.popLast()!)
            }
            op.append("/")
        } else if input[i] == "+"{
            while !op.isEmpty{
                stack.append(op.popLast()!)
            }
            op.append("+")
        } else if input[i] == "-"{
            while !op.isEmpty{
                stack.append(op.popLast()!)
            }
            op.append("-")
        } else {
            stack.append(input[i])
        }
        continue
    } 
    else if input[i] == "+"{
        op.append("+")
    } else if input[i] == "-"{
        op.append("-")
    } else if input[i] == "*"{
        op.append("*")
    } else if input[i] == "/"{
        op.append("/")
    } else if input[i] == "(" || input[i] == ")" {
        continue
    } else {
        stack.append(input[i])
    }
}
for _ in 0..<op.count{
    stack.append(op.popLast()!)
}
print("\(stack.joined())")
