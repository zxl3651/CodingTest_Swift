var arr = Array(readLine()!.split(separator: " ").map{Int($0)!})
let (A,B,C) = (arr[0], arr[1], arr[2])
print((A+B) % C)
print(((A%C) + (B%C)) % C)
print((A*B) % C)
print(((A%C) * (B%C)) % C)
