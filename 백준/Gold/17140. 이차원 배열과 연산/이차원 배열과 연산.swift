import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
let (R,C,K) = (input[0] - 1, input[1] - 1, input[2])

var map = [[Int]]()

for _ in 0..<3 {
    map.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var answer = 0

// 정답 먼저 확인
// 연산 조건 확인
// 각 연산 실행(제일 넓은 칸을 기준으로 남은 칸은 0으로 채우기) + 0은 무시해야함 + 만약 100을 넘어가면 100개 이외의 추가는 버림
// 시간 1초 증가

var count = 0

func sortMap(dic: [Int: Int]) -> [Int] {
    let dic = dic.sorted{ $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value }
    var list = [Int]()
    for (i, k) in dic {
        list.append(i)
        list.append(k)
    }
    
    if list.count > 100 {
        list = Array(list[0..<100])
    }
    return list
}

while count <= 100 {
    var r = map.count
    let c = map[0].count
    
    if r > R && c > C {
        if map[R][C] == K {
            break
        }
    }
    
    // R연산
    if r >= c {
        var m = 0
        for y in 0..<r {
            var result: [Int:Int] = [Int:Int]()
            // 수와 등장횟수 구하기
            for x in 0..<c {
                if map[y][x] == 0 {
                    continue
                }
                if result[map[y][x]] != nil {
                    result[map[y][x]]! += 1
                } else {
                    result[map[y][x]] = 1
                }
            }
            // 정렬하기
            let list = sortMap(dic: result)
            m = max(m, list.count) // 최대 길이 구하기
            map[y] = list
        }
        // 최대 길이 맞춰서 넓히기
        for y in 0..<r {
            while map[y].count <= m - 1 {
                map[y].append(0)
            }
        }
    }
    // C연산
    else if r < c {
        var m = 0
        for x in 0..<c {
            var result = [Int:Int]()
            for y in 0..<r {
                if map[y][x] == 0 {
                    continue
                }
                if result[map[y][x]] != nil {
                    result[map[y][x]]! += 1
                } else {
                    result[map[y][x]] = 1
                }
            }
            let list = sortMap(dic: result)
            m = max(m, list.count)
            //TODO: - y줄 list로 변경
            if r <= m {
                while r < m {
                    map.append([Int](repeating: 0, count: c))
                    r += 1
                }
            }
            for i in 0..<list.count {
                map[i][x] = list[i]
            }
            if list.count < r {
                var index = list.count
                while index < r {
                    map[index][x] = 0
                    index += 1
                }
            }
        }
    }
    
    count += 1
}

print(count > 100 ? -1 : count)
