import Foundation

let N = Int(readLine()!)!
var arr : [Int] = []
for _ in 0..<N{
    arr.append(Int(readLine()!)!)
}
for i in arr.sorted(){
    print(i)
}
