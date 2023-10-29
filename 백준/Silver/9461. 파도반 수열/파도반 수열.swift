import Foundation

let T = Int(readLine()!)!
var P = [1,1,1,2,2,3,4,5,7,9]

func fib(_ num: Int) -> Int {
    if num < P.count {
        return P[num]
    } else {
        for i in stride(from: P.count, through: num, by: 1){
            P.append(P[i - 2] + P[i - 3])
        }
        return P[num]
    }
}


for _ in 0..<T{
    let N = Int(readLine()!)!
    print(fib(N-1))
}