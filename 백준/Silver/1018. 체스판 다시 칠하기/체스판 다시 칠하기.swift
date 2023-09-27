import Foundation

var input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (N, M) = (input[0], input[1])
var board : [[String]] = []

for _ in 0..<N{
    board.append(readLine()!.map{String($0)})
}
var answer = 64

for i in 0...N-8{
    for j in 0...M-8{
        var cnt1 = 0 // 화이트인 경우
        var cnt2 = 0 // 블랙인 경우
        
        for col in i..<i+8{
            for row in j..<j+8{
                if (col + row) % 2 == 0{
                    if board[col][row] == "B"{
                        cnt2 += 1
                    } else {
                        cnt1 += 1
                    }
                } else{
                    if board[col][row] == "B"{
                        cnt1 += 1
                    } else{
                        cnt2 += 1
                    }
                }
            }
        }
        answer = min(answer, cnt1, cnt2)
    }
}
print(answer)
