// Dequeue 클래스 구현
class Deque<T> {
    var enqueue: [T]
    var dequeue: [T] = []
    
    var count: Int {
        return enqueue.count + dequeue.count
    }
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    init(_ queue: [T]) {
        enqueue = queue
    }
    
    func pushLast(_ element: T) {
        enqueue.append(element)
    }
    
    func pushFirst(_ element: T) {
        dequeue.append(element)
    }
    
    func popLast() -> T {
        if enqueue.isEmpty {
            enqueue = dequeue.reversed()
            dequeue.removeAll()
        }
        return enqueue.popLast()!
    }
    
    func popFirst() -> T {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()!
    }
    
}

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map{ Int($0)! } // 자료구조 타입
var B = readLine()!.split(separator: " ").map{ Int($0)! } // 내용물
var M = Int(readLine()!)!// 삽입 데이터 수
var C = readLine()!.split(separator: " ").map{ Int($0)! } // 삽입 데이터

var arr : [Int] = []
// stack이면 넣어야하는값, queue면 기존 값이 유지된다. 따라서 stack이면 무시해도 된다는 뜻!
for i in 0..<N{
    if A[i] == 0{
        arr.append(B[i])
    }
}


var deque = Deque(arr)

for i in 0..<M{
    deque.pushFirst(C[i])
}

var answer = ""
for _ in 0..<M{
    answer += "\(deque.popLast()) "
}

print(answer)
