import Foundation

var answer = ""
while(true) {
    var input = readLine()!.split(separator: " ").map{Int($0)!}
    if input[0] == 0 && input[1] == 0 && input[2] == 0 {
        break
    }
    var m = max(input[0], input[1], input[2])
    var others = [Int]()
    for i in input {
        if m != i {
            others.append(i)
        }
    }
    if input[0] == input[1] && input[1] == input[2] {
        answer += "Equilateral\n"
    } else if input[0] == input[1] {
        if checkTriangle(input[0], input[1], input[2]) {
            answer += "Invalid\n"
        } else {
            answer += "Isosceles\n"
        }
    } else if input[1] == input[2] {
        if checkTriangle(input[1], input[2], input[0]) {
            answer += "Invalid\n"
        } else {
            answer += "Isosceles\n"
        }
    } else if input[0] == input[2] {
        if checkTriangle(input[0], input[2], input[1]) {
            answer += "Invalid\n"
        } else {
            answer += "Isosceles\n"
        }
    } else if m >= (others[0] + others[1]) {
        answer += "Invalid\n"
    } else {
        answer += "Scalene\n"
    }
}

func checkTriangle(_ num1: Int,_ num2: Int,_ num3: Int) -> Bool {
    return num1 + num2 <= num3
}
print(answer)
