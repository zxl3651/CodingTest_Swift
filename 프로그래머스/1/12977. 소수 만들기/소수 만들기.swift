import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer = 0

    var flag = Array(repeating: true, count: 3000)
    for i in stride(from:2, to:3000, by:1){
        if(!flag[i]){
            continue
        } else {
            for j in stride(from:2*i, to: 3000, by: i){
                flag[j] = false
            }
        }
    }
    for i in 0..<nums.count-2{
        for j in i+1..<nums.count-1{
            for k in j+1..<nums.count{
                if flag[nums[i]+nums[j]+nums[k]] {
                    answer += 1
                }
            }
        }
    }
    return answer
}