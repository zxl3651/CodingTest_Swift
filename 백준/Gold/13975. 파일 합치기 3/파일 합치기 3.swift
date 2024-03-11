struct Heap<T: Comparable> {
    private var elements: [Int] = []
    
    var count: Int {
        elements.count
    }
    
    mutating func insert(element: Int) {
        if elements.isEmpty {
            elements.append(element)
            elements.append(element)
            return
        }
        elements.append(element)
        swimUp(index: elements.count - 1)
    }
    
    mutating func swimUp(index: Int) {
        var index = index
        
        while index > 1 && elements[index] < elements[index / 2] {
            elements.swapAt(index, index / 2)
            index /= 2
        }
    }
    
    mutating func pop() -> Int? {
        if elements.count < 2 { return nil }
        
        let deletedElement = elements[1]
        elements.swapAt(1, elements.count - 1)
        elements.removeLast()
        
        diveDown(index: 1)
        return deletedElement
    }
    
    mutating func diveDown(index: Int) {
        let leftIndex = index * 2
        let rightIndex = index * 2 + 1
        var swapIndex = index
        
        if leftIndex <= elements.count - 1 && elements[leftIndex] < elements[swapIndex] {
            swapIndex = leftIndex
        }
        
        if rightIndex <= elements.count - 1 && elements[rightIndex] < elements[swapIndex] {
            swapIndex = rightIndex
        }
        
        if swapIndex != index {
            elements.swapAt(index, swapIndex)
            diveDown(index: swapIndex)
        }
        
    }
    
}

import Foundation

let N = Int(readLine()!)!

for _ in 0..<N {
    let K = Int(readLine()!)!
    
    var heap = Heap<Int>()
    
    let file = readLine()!.split(separator: " ").map{ Int($0)! }
    
    for i in 0..<K {
        heap.insert(element: file[i])
    }
    
    var answer = 0
    while heap.count != 2 {
        let first = heap.pop()!
        let second = heap.pop()!
        heap.insert(element: first + second)
        answer += first + second
    }
    print(answer)
}