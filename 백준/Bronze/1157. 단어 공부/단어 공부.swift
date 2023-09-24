import Foundation

let word = readLine()!.map{ String($0) }
var dict : [String:Int] = [:]
var maxC : [String] = []

for c in word{
    var char = c.lowercased()
    if dict[char] == nil{
        dict[char] = 1
    } else{
        dict[char]! += 1
    }
}
for (k,v) in dict{
    if v == dict.values.max(){
        maxC.append(k)
    }
}
if maxC.count == 1{
    print(maxC[0].uppercased())
} else{
    print("?")
}
