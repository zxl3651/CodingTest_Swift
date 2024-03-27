import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    let str1 = Int("\(a)\(b)")!
    let str2 = Int("\(b)\(a)")!
    return str1 >= str2 ? str1 : str2
}