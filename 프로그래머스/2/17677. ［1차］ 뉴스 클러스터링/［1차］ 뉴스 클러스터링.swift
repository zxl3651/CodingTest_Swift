func intersection(_ str1 : [String],_ str2 : [String]) -> Double {
    var result = 0.0
    for i in Set(str1).intersection(Set(str2)){
        let cnt1 = str1.filter{ $0 == i }.count
        let cnt2 = str2.filter{ $0 == i }.count
        result += Double(min(cnt1, cnt2))
    }
    return result
}

func solution(_ str1:String, _ str2:String) -> Int {
    var str1 = str1.lowercased()
    var str2 = str2.lowercased()
    
    var arr1 : [String] = []
    var arr2 : [String] = []
    
    for i in 0..<str1.count - 1 {
        let startIdx = str1.index(str1.startIndex, offsetBy: i)
        let endIdx = str1.index(str1.startIndex, offsetBy: i+2)
        let str = String(str1[startIdx..<endIdx])
        var flag = true
        let tmp = str.map{ String($0) }
        for j in 0..<tmp.count{
            let char = Character(tmp[j])
            if !char.isLetter {
                flag = false
            }
        }
        if flag {
            arr1.append(str)
        }
    }
    
    for i in 0..<str2.count - 1 {
        let startIdx = str2.index(str2.startIndex, offsetBy: i)
        let endIdx = str2.index(str2.startIndex, offsetBy: i+2)
        let str = String(str2[startIdx..<endIdx])
        var flag = true
        let tmp = str.map{ String($0) }
        for j in 0..<tmp.count{
            let char = Character(tmp[j])
            if !char.isLetter {
                flag = false
            }
        }
        if flag {
            arr2.append(str)
        }
    }
    
    var answer = 0.0
    let inter = intersection(arr1, arr2)
    let union = Double(arr1.count + arr2.count) - inter
    if inter == 0 && union == 0{
        answer = 1
    } else {
        answer = inter / union
    }
    return Int(answer * 65536)
}

