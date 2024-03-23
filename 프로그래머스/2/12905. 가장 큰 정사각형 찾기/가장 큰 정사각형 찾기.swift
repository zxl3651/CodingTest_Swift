import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var answer:Int = 0
    
    var dp = board
    
    let dy = [-1,-1,0]
    let dx = [-1, 0, -1]
    
    if board.count == 1 || board[0].count == 1 {
        answer = 1
    }
    else {
        for y in 1..<board.count {
            for x in 1..<board[y].count {
                if board[y][x] == 1 {
                    var result = Int.max
                    for i in 0..<3{
                        let ny = y + dy[i]
                        let nx = x + dx[i]
                        
                        if ny >= board.count || ny < 0 || nx >= board[y].count || nx < 0 {
                            continue
                        }
                        
                        result = min(result, dp[ny][nx])
                    }
                    dp[y][x] += result
                    answer = max(answer, dp[y][x])
                }
            }
        }
    }
    

    return answer * answer
}
