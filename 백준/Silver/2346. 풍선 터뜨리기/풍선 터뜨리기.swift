class Deque<T> {
    var enQueue: [T]
    var deQueue: [T] = []
    
    var count: Int {
        return enQueue.count + deQueue.count
    }
    
    var isEmpty: Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }
    
    init(_ queue: [T]) {
        enQueue = queue
    }
    
    func pushLast(_ element: T) {
        enQueue.append(element)
    }
    
    func pushFirst(_ element: T) {
        deQueue.append(element)
    }
    
    func popLast() -> T {
        if enQueue.isEmpty {
            enQueue = deQueue.reversed()
            deQueue.removeAll()
        }
        return enQueue.popLast()!
    }
    
    func popFirst() -> T {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()!
    }
    
}

var N = Int(readLine()!)!
var answer = ""
var balloon = readLine()!.split(separator: " ").map{ Int($0)! }
var indexBalloon : [(index: Int, value: Int)] = []
for i in 0..<balloon.count{
    indexBalloon.append((i+1, balloon[i]))
}
var deque = Deque(indexBalloon)

var index = 0

var boom : (index: Int, value: Int) = (0, 0)
var number = 0
var flag = true
while !deque.isEmpty{
    if index == boom.value{
        boom = deque.popFirst()
        if boom.value < 0 { // 풍선 안의 숫자가 음수라면
            flag = false
            
        } else { // 풍선 안의 숫자가 양수라면
            flag = true
            boom.value -= 1
        }
        answer += "\(boom.index) "
        index = 0
        continue
    }
    
    if flag{
        deque.pushLast(deque.popFirst())
        index += 1
    } else {
        deque.pushFirst(deque.popLast())
        index -= 1
    }
}
print(answer)