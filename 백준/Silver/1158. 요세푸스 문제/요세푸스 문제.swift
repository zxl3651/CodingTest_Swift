// Node 클래스
class Node {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

// 연결리스트 클래스
class LinkedList {
    var head: Node?
    
    func append(_ value: Int) {
        let newNode = Node(value: value)
        if let lastNode = getLastNode() {
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    func getLastNode() -> Node? {
        var lastNode = head
        while let next = lastNode?.next {
            lastNode = next
        }
        return lastNode
    }
    
    func popNode(_ n: Int, _ popNode: Node) -> Node {
        var current = popNode // pop해야할 node
        var previous = current // popNode의 전 node
        
        for _ in 0..<n {
            previous = current
            current = current.next!
        }
        previous.next = current.next // 전 노드는 next값을 skip
        
        return current
    }
}

var input = readLine()!.split(separator: " ").map{Int($0)!}
let (N, K) = (input[0], input[1])

var linkedList = LinkedList()

for i in 0..<N {
    linkedList.append(i+1)
}

linkedList.getLastNode()?.next = linkedList.head // 원처럼 만들기

var answer = "<"
var popNode = linkedList.head!

for i in 0..<N {
    if i == 0 {
        popNode = linkedList.popNode(K-1, popNode)
    } else {
        popNode = linkedList.popNode(K, popNode)
    }
    if (i == N-1) {
        answer += "\(popNode.value)>"
    } else {
        answer += "\(popNode.value), "
    }
}

print(answer)
