import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var index = 0
    var turn = 1
    var result : [String] = []
    var answer : [Int] = [0, 0]
    for i in words{
        index += 1
        if index > n{
            index = 1
            turn += 1
        }
        if result.contains(i){
            answer[0] = index
            answer[1] = turn
            break
        }
        else {
            if result.isEmpty{
                result.append(i)
                continue
            }
            var tmp1 = Array(result.last!)
            var tmp2 = Array(i)
            print(tmp1, tmp2)
            if tmp1[tmp1.count-1] != tmp2[0]{
                answer[0] = index
                answer[1] = turn
                break
            }
            result.append(i)
        }
    }
    return answer
}