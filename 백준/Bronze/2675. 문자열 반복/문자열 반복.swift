import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let arr = readLine()!.split(separator: " ")
    let count = Int(String(arr[0]))!, c = String(arr[1])
    let startIndex = c.startIndex

    print(c.map{ String(repeating: $0, count: count)}.joined()  )
    
}
