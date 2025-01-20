import Foundation

var input = Int(readLine()!)!

print(input >= 90 ? ("A") : (input >= 80 ? ("B") : (input >= 70) ? ("C") : (input >= 60) ? ("D") : "F"))