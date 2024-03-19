import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
var (n, m, y, x, k) = (input[0], input[1], input[2], input[3], input[4])

var map = [[Int]]()

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var orders = readLine()!.split(separator: " ").map{ Int($0)! }

class Dice {
    var top: Int = 0
    var bottom: Int = 0
    var left: Int = 0
    var right: Int = 0
    var up: Int = 0
    var down: Int = 0
    
    func move(_ direction: Int, _ value: Int) -> Int {
        let temp = (top: top, bottom: bottom, left: left, right: right, up: up, down: down)
        
        switch direction {
            // 동
        case 1:
            bottom = temp.right
            right = temp.top
            top = temp.left
            left = temp.bottom
            // 서
        case 2:
            bottom = temp.left
            left = temp.top
            top = temp.right
            right = temp.bottom
            // 북
        case 3:
            bottom = temp.up
            up = temp.top
            top = temp.down
            down = temp.bottom
            // 남
        case 4:
            bottom = temp.down
            down = temp.top
            top = temp.up
            up = temp.bottom
        default:
            return value
        }
        // 주사위 top을 출력
        print(top)
        
        // map[ny][nx] 가 0일때는 주사위 밑바닥의 값 복사
        if value == 0 {
            return bottom
        }
        // 아닐때는 맵의 값을 주사위 밑으로 복사 후 0으로 변경
        else {
            bottom = value
            return 0
        }
    }
}
// 주사위 객체 생성
var dice = Dice()

for i in 0..<orders.count {
    let dy = [0, 0, -1, 1]
    let dx = [1, -1, 0, 0]
    
    let ny = y + dy[orders[i] - 1]
    let nx = x + dx[orders[i] - 1]
    
    // 움직일 수 없다면 명령을 무시
    if ny < 0 || ny >= n || nx < 0 || nx >= m {
        continue
    }
    
    // 움직일 수 있다면 주사위의 밑면과 map[ny, nx]의 값에 따라 복사여부 결정하기 그리고 주사위 맨위 출력
    map[ny][nx] = dice.move(orders[i], map[ny][nx])
    
    y = ny
    x = nx
}
