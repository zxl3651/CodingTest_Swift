let arr = readLine()!.split(separator: " ").map{ Double(String($0))! }
print("\(arr[0] / arr[1])")