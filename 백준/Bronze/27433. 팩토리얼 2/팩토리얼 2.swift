func factorial(_ num: Int) -> Int{
    if num == 0 || num == 1{
        return 1
    } else{
        return num * factorial(num - 1)
    }
}

let N = Int(readLine()!)!
print(factorial(N))