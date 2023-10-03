import Foundation
// 빠른 입력 FileIO
/*
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
 */

struct Queue {
    var left:[Int] = []
    var right:[Int] = []
    
    var count : Int {
        left.count + right.count
    }
    
    var isEmpty : Bool {
        left.isEmpty && right.isEmpty
    }
    
    var first : Int{
        guard !isEmpty else { return -1 }
        return left.isEmpty ? right.first! : left.last!
        // first면 먼저 왼쪽 스택을 확인해야 하니까 left.isEmpty를 먼저 해야한다!
    }
    
    var last : Int{
        guard !isEmpty else { return -1 }
        return right.isEmpty ? left.first! : right.last!
        // last면 먼저 오른쪽 스택을 확인해야 하니까 right.isEmpty를 먼저 해야한다!
    }
    
    mutating func enqueue(_ value: Int){
        right.append(value)
    }
    
    mutating func dequeue() -> Int{
        guard !isEmpty else { return -1 }
        if left.isEmpty{
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()!
    }
}

let N = Int(readLine()!)!
var q = Queue()
var number = 1
for _ in 0..<N{
    q.enqueue(number)
    number += 1
}
while q.count != 1{
    q.dequeue()
    q.enqueue(q.dequeue())
}
print(q.first)
