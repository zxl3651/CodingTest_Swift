import Foundation

var word = readLine()!.map{ String($0) }
var rev = word.reversed().joined()
if word.joined() == rev{
    print(1)
} else{
    print(0)
}
