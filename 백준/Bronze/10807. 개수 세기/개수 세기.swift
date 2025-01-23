var N = Int(readLine()!)!
var arr = Array(readLine()!.split(separator: " ").map{Int($0)!})
var find = Int(readLine()!)!

print(arr.filter({$0 == find}).count)

