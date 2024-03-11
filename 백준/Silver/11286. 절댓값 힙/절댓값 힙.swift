struct Heap<T: Comparable> {
    private var elements: [Int] = []
    
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
        
        while index > 1 && abs(elements[index]) <= abs(elements[index / 2]) {
            if abs(elements[index]) == abs(elements[index / 2]) {
                if elements[index] < elements[index / 2] {
                    elements.swapAt(index, index / 2)
                }
            } else {
                elements.swapAt(index, index / 2)
            }
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
        
        if leftIndex <= elements.count - 1 && abs(elements[leftIndex]) <= abs(elements[swapIndex]) {
            if abs(elements[leftIndex]) == abs(elements[swapIndex]) {
                if elements[leftIndex] < elements[swapIndex] {
                    swapIndex = leftIndex
                }
            } else {
                swapIndex = leftIndex
            }
        }
        
        if rightIndex <= elements.count - 1 && abs(elements[rightIndex]) <= abs(elements[swapIndex]) {
            if abs(elements[rightIndex]) == abs(elements[swapIndex]) {
                if elements[rightIndex] < elements[swapIndex] {
                    swapIndex = rightIndex
                }
            } else {
                swapIndex = rightIndex
            }

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