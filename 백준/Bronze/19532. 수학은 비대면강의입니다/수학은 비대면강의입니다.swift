import Foundation

var input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (a,b,c,d,e,f) = (input[0], input[1], input[2],input[3],input[4],input[5])

for i in -999...999{
    for j in -999...999{
        if (a*i) + (b*j) == c && (d*i) + (e*j) == f{
            print("\(i) \(j)")
            break
        }
    }
}
