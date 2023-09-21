import Foundation

let line = Array(readLine()!).map { String($0)
}

for i in Character("a").asciiValue!...Character("z").asciiValue!{
    var char = String(UnicodeScalar(i))
    if line.contains(char){
        print("\(line.firstIndex(of: char)!)", terminator: " ")
    } else{
        print("-1", terminator: " ")
    }
}
