func fibonacci(_ num: Int) -> Int{
    if num == 0{
        return 0
    }
    else if num == 1{
        return 1
    } else{
        return fibonacci(num-1) + fibonacci(num-2)
    }
}

let N = Int(readLine()!)!
print(fibonacci(N))