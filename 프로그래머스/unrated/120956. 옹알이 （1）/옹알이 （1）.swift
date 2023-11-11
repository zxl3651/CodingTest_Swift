import Foundation

func solution(_ babbling:[String]) -> Int {
    let crying = ["aya", "ye", "woo", "ma"]
    var arr = babbling
    for i in 0..<arr.count{
        for j in 0..<crying.count{
            arr[i] = arr[i].replacingOccurrences(of: crying[j], with: " ").trimmingCharacters(in: .whitespaces)
        }
    }
    return arr.filter{ $0 == "" }.count
}