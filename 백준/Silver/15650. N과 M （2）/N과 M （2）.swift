let input = readLine()!.split(separator: " ").map{Int($0)!}
let (N,M) = (input[0], input[1])
var answer : [Int] = []

func dfs(){
    if answer.count == M{
        if answer == answer.sorted(by: <){
            print(answer.map{String($0)}.joined(separator: " "))
        }
        return
    } else {
        for i in 1...N{
            if !answer.contains(i){
                answer.append(i)
                dfs()
                answer.removeLast()
            }
        }
    }
}

dfs()