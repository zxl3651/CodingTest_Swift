var A = Int(readLine()!)!
var B = Int(readLine()!)!
var C = Int(readLine()!)!

var result = String(A * B * C).map{ String($0)}
for i in 0...9 {
    print(result.reduce(0, { partialResult, ch in
        partialResult + (ch == String(i) ? 1 : 0)
    }))
}
