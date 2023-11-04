func solution(_ a:Int, _ b:Int) -> Int {
    var answer = 0
    if a > b {
        for i in b...a{
            answer += i
        }
    } else {
        for i in a...b{
            answer += i
        }
    }
    return answer
}