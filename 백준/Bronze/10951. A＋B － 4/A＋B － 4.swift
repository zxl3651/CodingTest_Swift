import Foundation

while let line = readLine(){
    let arr = line.split(separator: " ").map{Int(String($0))!}
    print(arr[0] + arr[1])
}
