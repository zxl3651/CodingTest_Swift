let time = readLine()!.split(separator: " ").map{ Int(String($0))! }
var (H,M) = (time[0], time[1])
if M >= 45{
    M -= 45
}else{
    H -= 1
    if H < 0{
        H = 23
    }
    M += 15
}
print(H,M)
