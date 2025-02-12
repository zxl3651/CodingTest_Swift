var N = Int(readLine()!)!
var deque = [Int]()
var enque = [Int]()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    switch (input[0]) {
    case "push_front":
        deque.append(Int(input[1])!)
    case "push_back":
        enque.append(Int(input[1])!)
    case "pop_front":
        if deque.isEmpty {
            deque = enque.reversed()
            enque.removeAll()
        }
        deque.isEmpty ? print(-1) : print(deque.popLast()!)
    case "pop_back":
        if enque.isEmpty {
            enque = deque.reversed()
            deque.removeAll()
        }
        enque.isEmpty ? print(-1) : print(enque.popLast()!)
    case "size":
        print(deque.count + enque.count)
    case "empty":
        if deque.isEmpty && enque.isEmpty {
            print(1)
        } else {
            print(0)
        }
    case "front":
        if deque.isEmpty {
            print(enque.first ?? -1)
        } else {
            print(deque.last ?? -1)
        }
    case "back":
        if enque.isEmpty {
            print(deque.first ?? -1)
        } else {
            print(enque.last ?? -1)
        }
    default:
        break
    }
}
