import Foundation

func dfs(_ num: Int){
    if op.reduce(0, +) == 0{
        result.append(num)
    } else {
        for i in 0..<4{
            if op[i] > 0{
                op[i] -= 1
                index += 1
                switch arr[i]{
                case "+":
                    dfs(num + A[index])
                case "-":
                    dfs(num - A[index])
                case "*":
                    dfs(num * A[index])
                case "/":
                    dfs(num / A[index])
                default:
                    break
                }
                index -= 1
                op[i] += 1
            }
        }
    }
}

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map{ Int($0)! }
var op = readLine()!.split(separator: " ").map{ Int($0)! }
var arr = ["+", "-", "*", "/"]

var result : [Int] = []
var index = 0

dfs(A[0])

print("\(result.max()!)\n\(result.min()!)")