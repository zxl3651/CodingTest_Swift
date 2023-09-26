import Foundation

var arr = Array(repeating: Array(repeating: 0, count: 9), count: 9)
for i in 0..<9{
    arr[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}

var max = -1
var index1 = 0, index2 = 0
for i in 0..<9{
    for j in 0..<9{
        if max < arr[i][j]{
            max = arr[i][j]
            (index1, index2) = (i+1, j+1)
        }
    }
}
print(max)
print(index1, index2)
