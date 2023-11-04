func solution(_ n:Int64) -> [Int] {
    return Array(String(n)).map{String($0)}.reversed().map{Int($0)!}
}