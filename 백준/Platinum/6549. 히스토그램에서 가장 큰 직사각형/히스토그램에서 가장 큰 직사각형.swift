while let input = readLine(), input != "0" {
    var rectangle = input.split(separator: " ").map{Int($0)!}
    let n = rectangle[0]
    var stack = [(index: Int, height: Int)]()
    var answer = 0
    
    func update(_ i: Int) {
        // 스택의 마지막 높이가 추가하려는 높이 이상이면
        while let top = stack.last, top.height >= rectangle[i] {
            stack.removeLast()
            
            // pop 하고나서 마지막 인덱스까지가 width
            if let last = stack.last {
                answer = max(answer, top.height * (i - 1 - last.index))
            } else {
                // stack이 비어있다면 인덱스 자체가 width
                answer = max(answer, top.height * (i - 1))
            }
        }
    }
    
    for i in 1...n {
        update(i)
        stack.append((i, rectangle[i]))
    }
    
    rectangle += [0]
    update(n+1)
    
    print(answer)
}
