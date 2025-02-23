import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> Int {
        var str = 0
        var now = read()

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
                && now != 32 && now != 0 {
            str += Int(now)
            now = read()
        }

        return str
    }
}

struct Deque<Element>{
    private var inStack = [Element]()
    private var outStack = [Element]()
    
    mutating func enqueue(_ newElement: Element) {
        inStack.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack.removeAll()
        }
        
        return outStack.popLast()
    }
    
    mutating func popLast() -> Element? {
        if inStack.isEmpty {
            inStack = outStack.reversed()
            outStack.removeAll()
        }
        
        return inStack.popLast()
    }
    func isEmpty() -> Bool{
        return inStack.isEmpty && outStack.isEmpty
    }
    
    func front() -> Element?{
        if let result = outStack.last{
            return result
        }else{
            return inStack.first
        }
    }
    
    func rear() -> Element?{
        if let result = inStack.last{
            return result
        }else{
            return outStack.first
        }
    }
    
}

let fileIO = FileIO()
let N = fileIO.readInt(), L = fileIO.readInt()
var deck = Deque<(Int, Int)>()
var answer = ""

for i in 0..<N {
    let value = fileIO.readInt()
    
    if deck.isEmpty() {
        deck.enqueue((value, i))
    } else {
        if deck.front()!.1 == i - L {
            deck.dequeue()
        }
        while !deck.isEmpty() && deck.rear()!.0 > value {
            deck.popLast()
        }
        deck.enqueue((value, i))
    }
    answer += "\(deck.front()!.0) "
}
print(answer)