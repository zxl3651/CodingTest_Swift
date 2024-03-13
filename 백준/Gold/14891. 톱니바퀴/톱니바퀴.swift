import Foundation

var gear: [[Int]] = []
for _ in 0..<4 {
    gear.append(readLine()!.map{ Int(String($0))! })
}

let k = Int(readLine()!)!
var rotate: [(Int, Int)] = []
for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    rotate.append((input[0] - 1, input[1]))
}

// 돌리는 톱니바퀴마다 1, 0 여부를 확인 후 전체 톱니바퀴를 돌려야함
// 이때, 만약 1, 0 여부가 같다면 return
// 다르다면, 그 옆의 톱니바퀴 돌리는 함수 return
// 필요한건 톱니바퀴 돌리는 함수(돌리는 톱니바퀴 번호 == 2,3 -> 2번 돌리는 함수 return, 1,4 -> 1번 돌리는 함수)
func right_rotate(_ wheel: Int, _ direction: Int, _ flag: [Bool]) {
    // 전체 톱니바퀴 상태로 방향을 돌릴지 말지 결정
    // 0, -1
    var index = wheel
    var dic = direction == 1 ? true : false
    
    while true {
        index += 1
        if index == 4 {
            break
        }
        let subIndex = index - 1
        
        if flag[subIndex] == false {
            break
        } else {
            if dic {
                gear[index] = Array(gear[index][7..<8] + gear[index][0..<7])
            } else {
                gear[index] = Array(gear[index][1..<8] + gear[index][0..<1])
            }
            dic.toggle()
            
        }
    }
}

func left_rotate(_ wheel: Int, _ direction: Int, _ flag: [Bool]) {
    // 전체 톱니바퀴 상태로 방향을 돌릴지 말지 결정
    // 2, -1
    var index = wheel
    var dic = direction == 1 ? true : false
    
    while true {
        index -= 1
        if index == -1 {
            break
        }
        
        var subIndex = index
        
        if index == 3 {
            subIndex = 2
        }
        
        if flag[subIndex] == false {
            break
        } else {
            if dic {
                gear[index] = Array(gear[index][7..<8] + gear[index][0..<7])
            } else {
                gear[index] = Array(gear[index][1..<8] + gear[index][0..<1])
            }
            dic.toggle()
        }
    }
}

for i in 0..<k {
    // true는 오른쪽, false는 왼쪽
    var index: [Bool] = []
    for j in 1..<4 {
        if gear[j-1][2] != gear[j][6] {
            index.append(true)
        } else {
            index.append(false)
        }
    }
    if rotate[i].1 == 1 {
        // 시계방향으로
        if rotate[i].0 == 0 {
            // 오른쪽으로만 돌리기
            right_rotate(rotate[i].0, -1, index)
        } else if rotate[i].0 == 3 {
            // 왼쪽으로만 돌리기
            left_rotate(rotate[i].0, -1, index)
        } else {
            // 오른쪽, 왼쪽 둘다 돌리기
            right_rotate(rotate[i].0, -1, index)
            left_rotate(rotate[i].0, -1, index)
        }
        gear[rotate[i].0] = Array(gear[rotate[i].0][7..<8] + gear[rotate[i].0][0..<7])
    } else {
        // 반시계방향으로
        if rotate[i].0 == 0 {
            // 오른쪽으로만 돌리기
            right_rotate(rotate[i].0, 1, index)
        } else if rotate[i].0 == 3 {
            // 왼쪽으로만 돌리기
            left_rotate(rotate[i].0, 1, index)
        } else {
            // 오른쪽, 왼쪽 둘다 돌리기
            right_rotate(rotate[i].0, 1, index)
            left_rotate(rotate[i].0, 1, index)
        }
        gear[rotate[i].0] = Array(gear[rotate[i].0][1..<8] + gear[rotate[i].0][0..<1])
    }
}

// 마지막으로 점수 합 계산해서 print
var answer = 0

for i in 0..<4 {
    if gear[i][0] == 1 {
        switch i {
        case 0: answer += 1
        case 1: answer += 2
        case 2: answer += 4
        case 3: answer += 8
        default: break
        }
    }
}

print(answer)
