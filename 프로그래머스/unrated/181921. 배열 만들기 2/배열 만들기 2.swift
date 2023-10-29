import Foundation

func solution(_ l:Int, _ r:Int) -> [Int] {
    let arr : [String] = ["1", "2", "3","4","6","7","8","9"]
    var answer : [Int] = []
    for i in l...r{
        let tmp = Array(String(i))
        var flag = true
        for j in tmp{
            if arr.contains((String(j))){
                flag.toggle()
                break
            }
        }
        if flag{
            answer.append(Int(String(tmp))!)
        }
    }
    if answer.isEmpty{
        return [-1]
    }
    return answer
}