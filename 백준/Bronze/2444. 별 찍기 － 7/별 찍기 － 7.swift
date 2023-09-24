import Foundation

let N = Int(readLine()!)!

var empty : Int = (2*N-1) / 2
var star : Int = 1
var flag : Bool = false
for _ in 0..<2*N-1{
    for _ in 0..<empty{ // 공백 출력
        print(" ", terminator: "")
    }
    for _ in 0..<star{
        print("*", terminator: "")
    }
    print("\n", terminator: "")
    if flag{
        empty += 1
        star -= 2
        continue
    } else{
        empty -= 1
        star += 2
    }
    if empty < 1 {
        flag.toggle()
    }
}
