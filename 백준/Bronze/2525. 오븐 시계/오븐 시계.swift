let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
var (H,M) = (arr[0], arr[1])
let time = Int(readLine()!)!

M += time
while(M > 59){
    M -= 60
    H += 1
    if H > 23{
        H = 0
    }
    
}

print(H,M)
