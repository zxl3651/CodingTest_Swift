// Dequeue 구조체 구현
struct Deque<T: Equatable> {
    var enqueue: [T] = []
    var dequeue: [T] = []
    
    var count: Int {
        enqueue.count + dequeue.count
    }
    
    var isEmpty: Bool {
        enqueue.isEmpty && dequeue.isEmpty
    }
    
    var first: T? {
        dequeue.isEmpty ? enqueue.first : dequeue.last
    }
    
    var last: T? {
        enqueue.isEmpty ? dequeue.first : enqueue.last
    }
    
    mutating func pushFirst(_ value:T){
        dequeue.append(value)
    }
    
    mutating func pushLast(_ value:T){
        enqueue.append(value)
    }
    
    mutating func popFirst() -> T? {
        if dequeue.isEmpty{
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
    mutating func popLast() -> T? {
        if enqueue.isEmpty {
            enqueue = dequeue.reversed()
            dequeue.removeAll()
        }
        return enqueue.popLast()
    }
    
    mutating func contains(_ value: T) -> Bool {
        return enqueue.contains(value) || dequeue.contains(value)
    }
    
    mutating func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
}

let N = Int(readLine()!)!
var deque = Deque<Int>()
for _ in 0..<N{
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    switch input[0]{
    case 1:
        deque.pushFirst(input[1])
    case 2:
        deque.pushLast(input[1])
    case 3:
        deque.isEmpty ? print(-1) : print(deque.popFirst()!)
    case 4:
        deque.isEmpty ? print(-1) : print(deque.popLast()!)
    case 5:
        print(deque.count)
    case 6:
        deque.isEmpty ? print(1) : print(0)
    case 7:
        deque.isEmpty ? print(-1) : print(deque.first!)
    case 8:
        deque.isEmpty ? print(-1) : print(deque.last!)
    default:
        continue
    }
}