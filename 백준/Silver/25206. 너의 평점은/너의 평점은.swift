import Foundation

let dict : [String:Double] = ["A+":4.5, "A0":4.0, "B+":3.5, "B0":3.0, "C+":2.5, "C0":2.0, "D+":1.5, "D0":1.0, "F":0.0, "P":0.0]
var pcnt = 0
var total : Double = 0

var sum : Double = 0
for _ in 0..<20{
    let grade = readLine()!.split(separator: " ")
    let credit = Double(grade[1])!
    total += credit
    let major = dict[String(grade[2])]!
    sum += (credit) * major
    if grade[2] == "P"{
        total -= credit
    }
}
print(sum / total)
