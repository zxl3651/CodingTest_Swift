import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n,k) = (input[0], input[1])

var belt = readLine()!.split(separator: " ").map{ Int($0)! }
var robot = [Bool](repeating: false, count: n * 2)

var cnt = 0

while true {
    // 만약 내구도가 0인 개수가 k 이상이면 종료, 아니면 반복
    if belt.filter({ $0 == 0 }).count >= k {
        break
    }
    cnt += 1
    
    // 벨트 이동(로봇과 함께)
    belt = Array(belt[belt.count - 1..<belt.count] + belt[0..<belt.count - 1])
    robot = Array(robot[robot.count - 1..<robot.count] + robot[0..<robot.count - 1])
    
    // 로봇 제거(n의 위치라면)
    if robot[n-1] == true {
        robot[n-1] = false
    }
    
    // 로봇들 한칸 이동(이동할 수 있다면)
    if robot.contains(true) {
        for i in stride(from: belt.count - 1, through: 0, by: -1) {
            if i == belt.count - 1 {
                if robot[i] == true && robot[0] == false && belt[0] > 0 {
                    robot[i] = false
                    robot[0] = true
                    belt[0] -= 1
                }
            } else {
                if robot[i] == true && robot[i+1] == false && belt[i+1] > 0 {
                    robot[i] = false
                    robot[i+1] = true
                    belt[i+1] -= 1
                }
            }
        }
    }
    
    // 로봇 제거(n의 위치라면)
    if robot[n-1] == true {
        robot[n-1] = false
    }
    
    // 로봇 올리기(올릴 수 있다면)
    if belt[0] > 0 && robot[0] == false {
        robot[0] = true
        belt[0] -= 1
    }
}
print(cnt)
