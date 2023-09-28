import Foundation

var num = Int(readLine()!)!
var cnt = 0
while(num > 0){
    if num % 5 == 0{
        cnt += num / 5
        num = 0
        break
    }
    num -= 3
    cnt += 1
}
num == 0 ? print(cnt) : print(-1)
