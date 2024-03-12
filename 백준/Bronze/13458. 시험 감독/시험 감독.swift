import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int($0)! }
let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (B, C) = (input[0], input[1])


// 각 시험장마다 총감독관으로 분리
// 인원수가 많으면 부감독관 추가해서 최종값 +
var answer = 0

for i in arr {
    if i <= B {
        answer += 1
    } else {
        let tmp = i - B
        if tmp % C == 0 {
            answer += (tmp / C) + 1
        } else {
            answer += (tmp / C) + 2
        }
    }
}

print(answer)
