import Foundation

var arr = Array(repeating: Array(repeating: Array(repeating: -1, count: 21), count: 21), count: 21)

func w(_ a: Int,_ b: Int,_ c: Int) -> Int{
    if a <= 0 || b <= 0 || c <= 0 {
        return 1
    }
    else if a > 20 || b > 20 || c > 20 {
        return w(20, 20, 20)
    }
    if arr[a][b][c] != -1 {
        return arr[a][b][c]
    }
    else {
        if a < b && b < c {
            arr[a][b][c] = w(a, b, c-1) + w(a, b-1, c-1) - w(a, b-1, c)
            return arr[a][b][c]
        }
    }
    arr[a][b][c] =  w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1)
    return arr[a][b][c]
}

while(true) {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let (a, b, c) = (input[0], input[1], input[2])
    if a == -1 && b == -1 && c == -1 {
        break
    }
    
    print("w(\(a), \(b), \(c)) = \(w(a, b, c))")
}
