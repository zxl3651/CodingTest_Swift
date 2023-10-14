import Foundation

// start에서 end로 via를 거쳐 총 num개의 원반을 운반할 때 각 이동과정을 출력하는 함수
func hanoi(_ num: Int,_ start: String,_ end: String,_ via: String){
    if num == 1{
        move(1, start, end)
    } else {
        hanoi(num - 1, start, via, end)
        move(num, start, end)
        hanoi(num - 1, via, end, start)
    }
}
// num 의 원반을 start에서 end로 옮기는 함수
func move(_ num:Int,_ start: String,_ end: String){
    answer += "\(start) \(end)\n"
    count += 1
}
let N = Int(readLine()!)!
var count = 0
var answer = ""
hanoi(N,"1","3","2")
print(count)
print(answer)
