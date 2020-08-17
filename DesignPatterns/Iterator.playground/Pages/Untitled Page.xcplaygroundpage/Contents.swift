import UIKit

/*
 The iterator design pattern provides sequential access to the elements of an aggregate object, without exposing the internal details of the traversed object
 
 
 */

public class Node<T> {
    public var key: T?
    var next: Node?
    
    init(_ value: T? = nil) {
        key = value
    }
}

public class Queue<T> {
    
    public var head: Node<T>?
    
    public var tail: Node<T>?
    
    func enqueue(_ value: T) {
        
        let newNode = Node<T>(value)
        
        // First elements value has not been set?
        
        guard head != nil else {
            head = newNode
            tail = head
            return
        }
        
        tail?.next = newNode
        tail = newNode
    }
    
    func dequeue() -> T? {
        guard let headItem = head?.key else {
            return nil
        }
        
        if let nextNode = head?.next {
            head = nextNode
        } else {
            head = nil
            tail = nil
        }
        return headItem
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func peek() -> T? {
        return head?.key
    }
}

var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)
queue.enqueue(5)
queue.enqueue(9108)
queue.enqueue(10482)
queue.enqueue(5)
queue.enqueue(2)
queue.enqueue(2)
queue.enqueue(5)
queue.enqueue(2)

//print(queue.peek() ?? "na")
//print(queue.dequeue() ?? "NA")

//MARK: -------------------------
//for item in queue....
//          this will not work until we conform below

// This allows us to iterate through the items in our queue. We must conform to Sequence, which has a method requirement of 'makeIterator' that creates an iterator and provides access to the elements of the Sequence
extension Queue: Sequence {
    public func makeIterator() -> QueueIterator<T> {
        return QueueIterator(self)
    }
}

public struct QueueIterator<T>: IteratorProtocol {
    
    private let queue: Queue<T>
    private var currentNode: Node<T>?
    
    init(_ queue: Queue<T>) {
        self.queue = queue
        currentNode = queue.head
    }
    
    mutating public func next() -> T? {
        guard let node = currentNode else {
            return nil
        }
        
        let nextKey = currentNode?.key
        currentNode = node.next
        return nextKey
    }
}

//for item in queue {
//    print(item)
//}

var queueIterator = queue.makeIterator()
while let item = queueIterator.next() {
    print(item)
}
