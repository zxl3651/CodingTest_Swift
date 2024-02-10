import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (a,b,c) = (input[0], input[1], input[2])

func DFS(B: Int) -> Int {
    if B == 0 {
        return 1
    }
    
    if B % 2 == 0 {
        let num = DFS(B: B / 2)
        return num % c * num % c
    } else {
        let num = DFS(B: (B - 1) / 2)
        return num % c * num % c * a % c
    }
}

print(DFS(B: b))