import Foundation

class Queue <T> {
    var enqueue:[T]
    var dequeue:[T] = []

    var count : Int {
        enqueue.count + dequeue.count
    }

    var isEmpty : Bool {
        enqueue.isEmpty && dequeue.isEmpty
    }

    init(_ queue: [T]) {
        enqueue = queue
    }
    var first : T?{
        dequeue.isEmpty ? enqueue.first : dequeue.last
    }

    var last : T?{
        enqueue.isEmpty ? dequeue.first : enqueue.last
    }

    func push(_ value: T){
        enqueue.append(value)
    }

    func pop() -> T{
        if dequeue.isEmpty{
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()!
    }

    func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
}

let N = Int(readLine()!)!
var queue = Queue([])

for _ in 0..<N{
    let input = readLine()!
    if input == "pop" {
        if queue.isEmpty {
            print(-1)
        } else {
            print(queue.pop())
        }
    } else if input == "size" {
        print(queue.count)
    } else if input == "empty" {
        print(queue.isEmpty ? 1 : 0)
    } else if input == "front" {
        print(queue.isEmpty ? -1 : queue.first!)
    } else if input == "back" {
        print(queue.isEmpty ? -1 : queue.last!)
    } else {
        queue.push(Int(input.split(separator: " ").last!)!)
    }
}
