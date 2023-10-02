import Foundation

while (true){
    let N = readLine()!
    if N == "."{
        break
    }
    var flag = false
    var stack : [Character] = []
    let arr = Array(N)
    for i in 0..<arr.count{
        if arr[i] == "(" || arr[i] == "["{
            stack.append(arr[i])
        } else if arr[i] == ")"{
            let tmp = stack.popLast()
            if tmp != "("{
                flag.toggle()
                break
            }
        } else if arr[i] == "]"{
            let tmp = stack.popLast()
            if tmp != "["{
                flag.toggle()
                break
            }
        }
    }
    if flag{
        print("no")
    } else if !stack.isEmpty{
        print("no")
    } else {
        print("yes")
    }
}
