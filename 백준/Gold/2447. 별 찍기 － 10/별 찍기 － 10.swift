func star(_ num: Int) -> [String]{
    if num == 3{
        return ["***", "* *", "***"]
    } else {
        var result : [String] = Array(repeating: "", count: num)
        let tmp = star(num / 3)
        let number = num / 3
        var index = 0
        for i in 0..<number{
            result[index] += String(repeating: tmp[i], count: 3)
            index += 1
        }
        for i in 0..<number{
            result[index] += (String(repeating: tmp[i], count: 1) + String(repeating: " ", count: num / 3) + String(repeating: tmp[i], count: 1))
            index += 1
        }
        for i in 0..<number{
            result[index] += String(repeating: tmp[i], count: 3)
            index += 1
        }
        return result
    }
}


let N = Int(readLine()!)!
var arr = star(N)
var answer = ""
arr.forEach{ answer += $0 + "\n" }
print(answer)