func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for i in 0..<n{
        var str1 = String(arr1[i], radix: 2)
        str1 = String(repeating: "0", count: n - str1.count) + str1
        var str2 = String(arr2[i], radix: 2)
        str2 = String(repeating: "0", count: n - str2.count) + str2
        
        let bin_str1 = str1.map{ String($0) }
        let bin_str2 = str2.map{ String($0) }
        var result = ""
        for j in 0..<n{
            if bin_str1[j] == "0" && bin_str2[j] == "0" {
                result += " "
            } else {
                result += "#"
            }
        }
        answer.append(result)
    }
    
    return answer
}