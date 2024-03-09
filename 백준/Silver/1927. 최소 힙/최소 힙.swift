struct Heap<T: Comparable> {
    private var elements: [T] = []
    
    mutating func insert(element: T) {
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
    
    mutating func pop() -> T? {
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

var answer = ""

let N = Int(readLine()!)!
var heap = Heap<Int>()

for _ in 0..<N {
    let input = Int(readLine()!)!
    if input == 0 {
        answer += "\(heap.pop() ?? 0)\n"
    } else {
        heap.insert(element: input)
    }
}

print(answer)
