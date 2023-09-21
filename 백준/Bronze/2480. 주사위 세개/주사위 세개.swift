let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

if (arr[0] == arr[1] && arr[1] == arr[2]){
    print(arr[0] * 1000 + 10000)
}else if (arr[0] == arr[1] || arr[0] == arr[2]){
    print(arr[0] * 100 + 1000)
}else if (arr[1] == arr[2]){
    print(arr[1] * 100 + 1000)
}else{
    print(arr.max()! * 100)
}
