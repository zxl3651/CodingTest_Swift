import Foundation

var num = Int(readLine()!)!
var cnt = 0
for i in 665..<Int.max{
    let number = String(i)
    var flag = 0
    
    for c in number{
        if c == "6"{
            flag += 1
        } else {
            flag = 0
        }
        if flag == 3{
            cnt += 1
        }
    }
    if cnt == num{
        print(i)
        break
    }
}
